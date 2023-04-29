#include "first_project/odometry_node.h"

OdometryNode::OdometryNode(ros::NodeHandle *nodeHandle):
	d{2.8}, queue{1000}, x{0}, y{0}, t_last{0}, theta{0} {

	odom_pub = nodeHandle->advertise<nav_msgs::Odometry>("/odometry", queue);
	custom_pub = nodeHandle->advertise<first_project::Odom>("/custom_odometry", queue);

	odom_sub = nodeHandle->subscribe("/speed_steer", queue, &OdometryNode::callback_odometry, this);
	clock_sub = nodeHandle->subscribe("/clock", queue, &OdometryNode::callback_clock, this);

	service = nodeHandle->advertiseService("/reset_odom", &OdometryNode::reset_odom, this);

	// For launch file
	// nodeHandle->getParam("starting_x", starting_x);
	// nodeHandle->getParam("starting_y", starting_y);
	// nodeHandle->getParam("starting_th", starting_th);
	// nodeHandle->getParam("use_sim_time", use_sim_time);
	
	// Set position to 0 when we start.
	odom.pose.pose.position.x = 0.0;
	odom.pose.pose.position.y = 0.0;
	odom.pose.pose.position.z = 0.0;

	// Set orientation to 0 when we start.
	odom.pose.pose.orientation.x = 0.0;
	odom.pose.pose.orientation.y = 0.0;
	odom.pose.pose.orientation.z = 0.0;
	odom.pose.pose.orientation.w = 0.0;
}

void OdometryNode::callback_odometry(const geometry_msgs::Quaternion::ConstPtr &msg){
	// Odometry message
	odom.header.stamp = time;
	odom.header.frame_id = "odom";

	speed = msg->x;
	steering_angle = msg->y;

	turning_radius = d/tan(steering_angle);

	omega = speed/turning_radius;

	delta_t = odom.header.stamp.toSec() - t_last;

	delta_theta = omega*delta_t;
	theta_new = theta+delta_theta;

	delta_x = speed*cos(theta)*delta_t;
	delta_y = speed*sin(theta)*delta_t;
	
	x_new = x+delta_x;
	y_new = y+delta_y;

	odom.pose.pose.position.x = x_new;
	odom.pose.pose.position.y = y_new;

	tf::Quaternion quat = tf::createQuaternionFromYaw(theta_new);
	tf::quaternionTFToMsg(quat, odom.pose.pose.orientation);

	odom.twist.twist.linear.x = speed*cos(theta);
	odom.twist.twist.linear.y = speed*sin(theta);

	t_last = odom.header.stamp.toSec();
	x = x_new;
	y = y_new;
	theta = theta_new;


	// Update custom message variables
	custom_x = x_new;
	custom_y = y_new;
	custom_th = theta_new;

	// Publish odom to topic /odometry
	odom_pub.publish(odom);
	// ROS_INFO(": %f", x);
}	

void OdometryNode::callback_clock(const rosgraph_msgs::Clock::ConstPtr &msg){
	time = msg->clock;
	double bag_timestamp = time.toSec();
	custom_timestamp = std::to_string(bag_timestamp);

	custom_odom.x = custom_x;
	custom_odom.y = custom_y;
	custom_odom.th = custom_th;
	custom_odom.timestamp = custom_timestamp;

	custom_pub.publish(custom_odom);
	// ROS_INFO("Clock: %d", custom_odom.x);

	odom_to_base_tr.setOrigin(tf::Vector3(custom_x, custom_y, 0.0));
	odom_to_base_q.setRPY(0.0, 0.0, custom_th);
	
	odom_to_base_tr.setRotation(odom_to_base_q);

	tf_broadcaster.sendTransform(tf::StampedTransform(odom_to_base_tr, msg->clock, "odom", "base_link"));
}

bool OdometryNode::reset_odom(first_project::Reset_odom::Request &req, first_project::Reset_odom::Response &res){
	odom.pose.pose.orientation.x = 0.0;
	odom.pose.pose.orientation.y = 0.0;
	odom.pose.pose.orientation.z = 0.0;
	odom.pose.pose.orientation.w = 0.0;

	odom.pose.pose.position.x = 0.0;
	odom.pose.pose.position.y = 0.0;
	odom.pose.pose.position.z = 0.0;

	odom.twist.twist.angular.x = 0.0;
	odom.twist.twist.angular.y = 0.0;
	odom.twist.twist.angular.z = 0.0;

	odom.twist.twist.linear.x = 0.0;
	odom.twist.twist.linear.y = 0.0;
	odom.twist.twist.linear.z = 0.0;

	odom_pub.publish(odom_reset);

	ROS_INFO("Odometry resetted.");

	res.resetted = true;

	return true;
}

