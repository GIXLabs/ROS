#!/bin/bash

# Clone the ros_kortex repository and install the necessary ROS dependencies
cd catkin_ws/src
git clone -b ros1 https://github.com/fetchrobotics/fetch_ros.git
git clone -b gazebo11 https://github.com/fetchrobotics/fetch_gazebo.git
git clone -b ros1 https://github.com/fetchrobotics/fetch_msgs.git
git clone -b ros1 https://github.com/fetchrobotics/power_msgs.git
git clone -b ros1 https://github.com/fetchrobotics/robot_controllers.git
cd ../
rosdep install --from-paths src --ignore-src -y #(Ignore the error: Unable to locate package ros-noetic-simple-grasping)
sudo apt install ros-noetic-rgbd-launch

# Source the workspace
source ~/.bashrc

# Done!
echo "ROS Fetch Package installed successfully!"

# Instructions to Run:
# chmod +x install_ros.sh
# ./install_fetch.sh
