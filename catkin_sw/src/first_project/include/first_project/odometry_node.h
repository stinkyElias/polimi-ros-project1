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

#include <string>
#include <cmath>

class OdometryNode{
    public:
        OdometryNode(ros::NodeHandle *nodeHandle);

        void callback_odometry(const geometry_msgs::Quaternion::ConstPtr &msg);
        void callback_clock(const rosgraph_msgs::Clock::ConstPtr &msg);
        bool reset_odom(first_project::Reset_odom::Request &req, first_project::Reset_odom::Response &res);

        void callback_front_left_tr(const sensor_msgs::LaserScan::ConstPtr &msg);
        void callback_front_right_tr(const sensor_msgs::LaserScan::ConstPtr &msg);
        void callback_rear_left_tr(const sensor_msgs::LaserScan::ConstPtr &msg);
        void callback_rear_right_tr(const sensor_msgs::LaserScan::ConstPtr &msg);

    private:
        ros::Publisher odom_pub;
        ros::Publisher custom_pub;
        ros::Publisher tf_pub;
        ros::Publisher srv_pub;

        ros::Subscriber odom_sub;
        ros::Subscriber clock_sub;
        ros::Subscriber fl_sub, fr_sub, rl_sub, rr_sub;

        ros::ServiceServer service;

        nav_msgs::Odometry odom;
        nav_msgs::Odometry odom_reset;

        first_project::Odom custom_odom;

    	tf::TransformBroadcaster tf_broadcaster;

        tf::Transform odom_to_base_tr;
        tf::Transform front_left_tr, front_right_tr, rear_left_tr, rear_right_tr;

        tf::Quaternion odom_to_base_q;
        tf::Quaternion no_rotation;
        tf::Quaternion q_fr, q_fl, q_rr, q_rl;

        uint32_t queue;

        double d, x, y, t, speed, steering_angle, turning_radius,
                omega, theta;
        double theta_next, x_next, y_next;
        double delta_x, delta_y, delta_theta, delta_t;
        double custom_x, custom_y, custom_th;                   // Variables for
        
        ros::Time time;
        std::string custom_timestamp;

        double starting_x, starting_y, starting_th;
        bool use_sim_time;
};