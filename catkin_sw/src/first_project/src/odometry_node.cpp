#include "first_project/odometry_node.h"

OdometryNode::OdometryNode(ros::NodeHandle *nodeHandle):
	d{2.8}, queue{10}, x{0}, y{0}, t{0}, theta{0} {

	odom_pub = nodeHandle->advertise<nav_msgs::Odometry>("/odometry", queue);
	custom_pub = nodeHandle->advertise<first_project::Odom>("/custom_odometry", queue);

	odom_sub = nodeHandle->subscribe("/speed_steer", queue, &OdometryNode::callback_odometry, this);
	
	service = nodeHandle->advertiseService("/reset_odom", &OdometryNode::reset_odom, this);

	// From launch file
	nodeHandle->getParam("starting_x", starting_x);
	nodeHandle->getParam("starting_y", starting_y);
	nodeHandle->getParam("starting_th", starting_th);
	
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
}

void OdometryNode::callback_odometry(const geometry_msgs::Quaternion::ConstPtr &msg){
	// Odometry message
	odom.header.stamp = time.now();
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
	custom_odom.x = x;
	custom_odom.y = y;
	custom_odom.th = theta;
	custom_odom.timestamp = std::to_string(odom.header.stamp.toSec());
	
	// tf of odom to base_link
	odom_to_base_tr.setOrigin(tf::Vector3(custom_odom.x, custom_odom.y, 0.0));
	odom_to_base_q.setRPY(0.0, 0.0, custom_odom.th);
	odom_to_base_tr.setRotation(odom_to_base_q);

	tf_broadcaster.sendTransform(tf::StampedTransform(odom_to_base_tr, odom.header.stamp, "odom", "base_link"));

	// Publish odom to topic /odometry
	odom_pub.publish(odom);

	// Publish custom_odom to topic /custom_odometry
	custom_pub.publish(custom_odom);
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

	res.resetted = true;

	ROS_INFO("Odometry resetted.");

	return true;
}