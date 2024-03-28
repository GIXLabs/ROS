#!/bin/bash

# Dependencies
sudo apt install python3 python3-pip
sudo python3 -m pip install conan==1.59
pip install pyquaternion # Optional

# Set Configurations
conan config set general.revisions_enabled=1
conan profile new default --detect > /dev/null
conan profile update settings.compiler.libcxx=libstdc++11 default

# Clone the ros_kortex repository and install the necessary ROS dependencies
cd catkin_ws/src
git clone -b noetic https://github.com/Kinovarobotics/ros_kortex.git
cd ../
rosdep install --from-paths src --ignore-src -y

# Build and source the workspace
catkin_make
echo "source devel/setup.bash" >> ~/.bashrc
source ~/.bashrc

# Done!
echo "ROS Kortex Packages installed successfully!"

# Instructions to Run:
# chmod +x install_ros.sh
# ./install_kortex.sh
