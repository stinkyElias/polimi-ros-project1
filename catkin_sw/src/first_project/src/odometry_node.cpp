#include "ros/ros.h"
#include "std_msgs/Header.h"
#include "std_msgs/String.h"
#include "std_msgs/Int64.h"
#include "geometry_msgs/TwistWithCovariance.h"
#include "geometry_msgs/PoseWithCovariance.h"
#include "geometry_msgs/Quaternion.h"
#include "nav_msgs/Odometry.h"
#include "rosbag/view.h"
#include "tf/tf.h"
#include "first_project/Odom.h"
#include "rosgraph_msgs/Clock.h"

#include <vector>
#include <string>
#include <cmath>

class OdometryNode{
    public:
		OdometryNode(ros::NodeHandle *nodeHandle){
			odom_pub = nodeHandle->advertise<nav_msgs::Odometry>("/odometry", queue);
			custom_pub = nodeHandle->advertise<first_project::Odom>("/custom_odometry", queue);
			// tf_pub =

			odom_sub = nodeHandle->subscribe("/speed_steer", queue, &OdometryNode::callback_odometry, this);
			clock_sub = nodeHandle->subscribe("/clock", queue, &OdometryNode::callback_clock, this);

			// Set position to 0 when we start.
			odom.pose.pose.position.x = 0.0;
			odom.pose.pose.position.y = 0.0;
			odom.pose.pose.position.z = 0.0;

			// Set orientation to 0 when we start.
			odom.pose.pose.orientation.x = 0.0;
			odom.pose.pose.orientation.y = 0.0;
			odom.pose.pose.orientation.z = 0.0;
			odom.pose.pose.orientation.w = 0.0;

			last_theta = 0;
			last_alpha = 0;
		}

		void callback_odometry(const geometry_msgs::Quaternion::ConstPtr &msg){
			// Odometry message
			odom.header.stamp = ros::Time::now();
			odom.header.frame_id = "odom";

			s = msg->x;									// Assumed that x is vehicle speed
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
			// ROS_INFO("alpha: %f", alpha);
		}

		void callback_clock(const rosgraph_msgs::Clock::ConstPtr &msg){
			
		}


    private:
		ros::Publisher odom_pub;
		ros::Publisher custom_pub;
		ros::Publisher tf_pub;

		ros::Subscriber odom_sub;
		ros::Subscriber clock_sub;

		nav_msgs::Odometry odom;

		int queue = 1000;
		double speed = 0;

		double d = 2.8; //meters
		double s;
		double alpha;
		double theta;

		double last_s;
		double last_alpha;
		double last_theta;

		double custom_x;
		double custom_y;
		double custom_th;
		double custom_timestamp;

};

int main(int argc, char** argv){
	ros::init(argc, argv, "odometry");
	ros::NodeHandle nodeHandle;

	OdometryNode odomNode = OdometryNode(&nodeHandle);

	ros::spin();
    
    return 0;
}



// chatGPT

// int queue = 1000;
// double speed = 0;

// int main(int argc, char** argv){
// 	ros::init(argc, argv, "odometry");
// 	ros::NodeHandle node;

// 	ros::Publisher publisher=node.advertise<nav_msgs::Odometry>("/odometry", queue);
	
// 	rosbag::Bag bag;
// 	bag.open("/home/stinky/Desktop/bags/first.bag", rosbag::bagmode::Read);
	
// 	std::vector<std::string> topics;
// 	topics.push_back(std::string("/speed_steer"));

// 	rosbag::View view(bag, rosbag::TopicQuery(topics));

// 	for(rosbag::MessageInstance const &m : view){
// 		geometry_msgs::Quaternion::ConstPtr quat = m.instantiate<geometry_msgs::Quaternion>();
// 		if(quat != NULL){
// 			nav_msgs::Odometry odom;
// 			odom.pose.pose.position.x = quat->x;
// 			odom.pose.pose.position.y = quat->y;

// 			publisher.publish(odom);
// 		}
// 	}

// 	bag.close();

// 	ros::spin();

// 	return 0;
// }