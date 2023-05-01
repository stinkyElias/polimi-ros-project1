#include "first_project/odometry_node.h"

int main(int argc, char** argv){
	ros::init(argc, argv, "odometry");
	
	ros::NodeHandle nodeHandle;
	OdometryNode odomNode = OdometryNode(&nodeHandle);

	ros::spin();
    
    return 0;
}