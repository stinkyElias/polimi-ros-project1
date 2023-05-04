We know that the simulation behaves weirdly. We have isolated the problem to the kinematics, but we could not figure out how to fix it in time to deliver. Since we get weird behavior for both a the tf and the odom element in Rviz this tells us that its probably the kinematic calculations.

We have tried different kinematic models such as Ackermann bicycle and tricycle approximation and differential drive. The delivered kinematic gives the best result.
