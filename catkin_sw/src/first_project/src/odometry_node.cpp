#include "first_project/odometry_node.h"

OdometryNode::OdometryNode(ros::NodeHandle *nodeHandle):
	last_theta{0}, last_alpha{0}, last_s{0}, d{2.8}, queue{1000}{

	odom_pub = nodeHandle->advertise<nav_msgs::Odometry>("/odometry", queue);
	custom_pub = nodeHandle->advertise<first_project::Odom>("/custom_odometry", queue);
	// srv_pub = nodeHandle->advertise<nav_msgs::Odometry>("/odometry", queue);

	odom_sub = nodeHandle->subscribe("/speed_steer", queue, &OdometryNode::callback_odometry, this);
	clock_sub = nodeHandle->subscribe("/clock", queue, &OdometryNode::callback_clock, this);

	service = nodeHandle->advertiseService("/reset_odom", &OdometryNode::reset_odom, this);
	
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
	odom.header.stamp = ros::Time::now();
	odom.header.frame_id = "odom";

	s = msg->x;		// Assumed that x is vehicle speed
	alpha = msg->y;

	// Pose without covariance
	theta = last_theta + s/d * (log(abs(cos(last_alpha))) - log(abs(cos(alpha))));
	odom.pose.pose.position.x += last_s*(sin(theta) - sin(last_theta));
	odom.pose.pose.position.y += last_s*(cos(theta) - cos(last_theta));

	tf::Quaternion quat = tf::createQuaternionFromYaw(last_theta);
	tf::quaternionTFToMsg(quat, odom.pose.pose.orientation);		

	// Twist without covariance
	odom.twist.twist.linear.x = last_s*cos(last_theta);
	odom.twist.twist.linear.y = last_s*sin(last_theta);

	odom.twist.twist.angular.z = s/d * tan(last_alpha);
	
	// Update speed, steering angle and vehicle angle
	last_s = s;
	last_alpha = alpha;
	last_theta = theta;

	// Update custom message variables
	custom_x = odom.pose.pose.position.x;
	custom_y = odom.pose.pose.position.y;
	custom_th = theta;

	// Publish odom to topic /odometry
	odom_pub.publish(odom);
	// ROS_INFO("x: %f", custom_x);
}	

void OdometryNode::callback_clock(const rosgraph_msgs::Clock::ConstPtr &msg){
	ros::Time time = msg->clock;
	double timestamp = time.toSec();
	custom_timestamp = std::to_string(timestamp);

	custom_odom.x = custom_x;
	custom_odom.y = custom_y;
	custom_odom.th = custom_th;
	custom_odom.timestamp = custom_timestamp;

	custom_pub.publish(custom_odom);
	// ROS_INFO("Clock: %d", custom_odom.x);
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