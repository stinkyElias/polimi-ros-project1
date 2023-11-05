Project no. 1 in the course Robotics at Politecnico di Milano

The project is an introduction to ROS (Noetic) and includes subjects as topics, nodes, publishers/subscribers, services, custom messages, parameters, launch files and transformations.

The node odometry_node is using Ackermann steering kinematics to predict the position of a four-wheeled autonomous vehicle which data is saved and played from a bag file. It is then making a tf from odom (base frame) to base_link (robot frame) and also publishes a nav_msgs/Odometry and a custom message first_project/Odom.

A launch file starts the node with initial parameters and static transformations from four LiDARs on each wheel.

The tf's can be visulized using rviz.
