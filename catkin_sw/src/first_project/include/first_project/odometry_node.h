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
#include "tf/transform_broadcaster.h"
#include "first_project/Odom.h"
#include "rosgraph_msgs/Clock.h"
#include "std_msgs/Duration.h"
#include "first_project/Reset_odom.h"
#include "sensor_msgs/LaserScan.h"

#include <vector>
#include <string>
#include <cmath>
#include <functional>

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

    	tf::TransformBroadcaster tf_broadcaster;
        tf::Transform odom_to_base_tr;
        tf::Quaternion odom_to_base_q;

        int queue;

        double d, x, y, t_last, speed, steering_angle, turning_radius,
                omega, delta_t, theta;
        double theta_new, x_new, y_new;
        double delta_x, delta_y, delta_theta;
        double custom_x, custom_y, custom_th;                   // Variables for
        
        ros::Time time;
        std::string custom_timestamp;

        double starting_x;
        double starting_y;
        double starting_th;
        bool use_sim_time;
};