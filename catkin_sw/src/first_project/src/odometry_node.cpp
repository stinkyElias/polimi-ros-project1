#include "first_project/odometry_node.h"

OdometryNode::OdometryNode(ros::NodeHandle *nodeHandle):
	d{2.8}, queue{10}, x{0}, y{0}, t{0}, theta{0} {

	odom_pub = nodeHandle->advertise<nav_msgs::Odometry>("/odometry", queue);
	custom_pub = nodeHandle->advertise<first_project::Odom>("/custom_odometry", queue);

	odom_sub = nodeHandle->subscribe("/speed_steer", queue, &OdometryNode::callback_odometry, this);
	clock_sub = nodeHandle->subscribe("/clock", queue, &OdometryNode::callback_clock, this);

	service = nodeHandle->advertiseService("/reset_odom", &OdometryNode::reset_odom, this);

	fl_sub = nodeHandle->subscribe("/sick_front_left/scan", queue, &OdometryNode::callback_front_left_tr, this);
	fr_sub = nodeHandle->subscribe("/sick_front_right/scan", queue, &OdometryNode::callback_front_right_tr, this);
	rl_sub = nodeHandle->subscribe("/sick_rear_left/scan", queue, &OdometryNode::callback_rear_left_tr, this);
	rr_sub = nodeHandle->subscribe("/sick_rear_right/scan", queue, &OdometryNode::callback_rear_right_tr, this);

	// From launch file
	nodeHandle->getParam("starting_x", starting_x);
	nodeHandle->getParam("starting_y", starting_y);
	nodeHandle->getParam("starting_th", starting_th);
	nodeHandle->getParam("use_sim_time", use_sim_time);
	
	// Set position to 0 when we start.
	odom.pose.pose.position.x = 0.0;
	odom.pose.pose.position.y = 0.0;
	odom.pose.pose.position.z = 0.0;

	// Set orientation to 0 when we start.
	odom.pose.pose.orientation.x = 0.0;
	odom.pose.pose.orientation.y = 0.0;
	odom.pose.pose.orientation.z = 0.0;
	odom.pose.pose.orientation.w = 1.0;

	custom_x = starting_x;
	custom_y = starting_y;
	custom_th = starting_th;

	q_fr.setRPY(-0.76, 0.0, M_PI);
	q_fl.setRPY(0.81, 0.0, M_PI);
	q_rr.setRPY(-2.3, 0.0, M_PI);
	q_rl.setRPY(2.38, 0.0, M_PI);
}

void OdometryNode::callback_odometry(const geometry_msgs::Quaternion::ConstPtr &msg){
	// Odometry message
	odom.header.stamp = time;
	odom.header.frame_id = "odom";

	speed = msg->x;
	steering_angle = msg->y;

	// Ackermann calculations

	delta_t = odom.header.stamp.toSec() - t;

	// Filter out small steering_angles to avoid division by zero.
	if(steering_angle < 0.001 && steering_angle > -0.001){
		turning_radius = 0;
		omega = 0;

		theta_next = theta;
		x_next = speed*cos(theta_next);
		y_next = speed*sin(theta_next);

	}else{
		turning_radius = d/tan(steering_angle);
		omega = speed/turning_radius;

		// Discrete integrations
		theta_next = theta + omega*delta_t;
		x_next = x + (speed/omega) * (sin(theta_next) - sin(theta));
		y_next = y - (speed/omega) * (cos(theta_next) - cos(theta));
	}

	// Set 2D odometry
	// Pose
	odom.pose.pose.position.x = x_next;
	odom.pose.pose.position.y = y_next;
	tf::Quaternion quat = tf::createQuaternionFromYaw(theta_next);
	tf::quaternionTFToMsg(quat, odom.pose.pose.orientation);

	// Twist
	odom.twist.twist.linear.x = speed*cos(theta_next);
	odom.twist.twist.linear.y = speed*sin(theta_next);
	odom.twist.twist.angular.z = omega;

	// Update "current" variables for next iteration
	x = x_next;
	y = y_next;
	theta = theta_next;
	t = odom.header.stamp.toSec();

	// Update custom message variables
	custom_x = x;
	custom_y = y;
	custom_th = theta;

	// Publish odom to topic /odometry
	odom_pub.publish(odom);
	// ROS_INFO("custom_theta: %f", custom_th);
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

	tf_broadcaster.sendTransform(tf::StampedTransform(odom_to_base_tr, time, "odom", "base_link"));
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

void OdometryNode::callback_front_left_tr(const sensor_msgs::LaserScan::ConstPtr &msg){
	front_left_tr.setOrigin(tf::Vector3(1.85, 0.93, 0.0));
	front_left_tr.setRotation(q_fl);

	tf_broadcaster.sendTransform(tf::StampedTransform(front_left_tr, time, "base_link", "sick_front_left"));
}

void OdometryNode::callback_front_right_tr(const sensor_msgs::LaserScan::ConstPtr &msg){
	front_right_tr.setOrigin(tf::Vector3(1.85, -0.93, 0.0));

	front_right_tr.setRotation(q_fr);

	tf_broadcaster.sendTransform(tf::StampedTransform(front_right_tr, time, "base_link", "sick_front_right"));
}

void OdometryNode::callback_rear_right_tr(const sensor_msgs::LaserScan::ConstPtr &msg){
	rear_right_tr.setOrigin(tf::Vector3(-1.75, -0.8, 0.0));
	rear_right_tr.setRotation(q_rr);

	tf_broadcaster.sendTransform(tf::StampedTransform(rear_right_tr, time, "base_link", "sick_rear_right"));
}

void OdometryNode::callback_rear_left_tr(const sensor_msgs::LaserScan::ConstPtr &msg){
	rear_left_tr.setOrigin(tf::Vector3(-1.85, 0.93, 0.0));
	rear_left_tr.setRotation(q_rl);

	tf_broadcaster.sendTransform(tf::StampedTransform(rear_left_tr, time, "base_link", "sick_rear_left"));
}