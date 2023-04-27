#pragma once

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
#include "std_msgs/Duration.h"
#include "first_project/Reset_odom.h"

#include <vector>
#include <string>
#include <cmath>

class OdometryNode{
    public:
        OdometryNode(ros::NodeHandle *nodeHandle);

        void callback_odometry(const geometry_msgs::Quaternion::ConstPtr &msg);
        void callback_clock(const rosgraph_msgs::Clock::ConstPtr &msg);
        bool reset_odom(first_project::Reset_odom::Request &req, first_project::Reset_odom::Response &res);
    
    private:
        ros::Publisher odom_pub;
        ros::Publisher custom_pub;
        ros::Publisher tf_pub;
        ros::Publisher srv_pub;

        ros::Subscriber odom_sub;
        ros::Subscriber clock_sub;

        ros::ServiceServer service;

        nav_msgs::Odometry odom;
        nav_msgs::Odometry odom_reset;

        first_project::Odom custom_odom;

        int queue;

        double d, s, alpha, theta;                              // Variables for
        double last_s, last_alpha, last_theta;                  // Variables for
        double custom_x, custom_y, custom_th;                   // Variables for
        std::string custom_timestamp;
};