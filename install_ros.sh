#!/bin/bash

# Add the ROS repository
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

sudo apt install -y curl # if you haven't already installed curl
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -

# Update the package list
sudo apt-get update

# Install ROS Noetic full version
sudo apt install -y ros-noetic-desktop-full
sudo apt-get update

# Setup environment variables
source /opt/ros/noetic/setup.bash
echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
source ~/.bashrc
sudo apt-get update


# Create a Catkin workspace
mkdir -p ~/catkin_ws/src
cd ~/catkin_ws/src
catkin_init_workspace
cd ~/catkin_ws
catkin_make

# Dependencies
sudo apt install -y python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential
sudo apt install -y python3-rosdep
sudo rosdep init
rosdep update

cd ~/catkin_ws/src/
git clone https://github.com/ROBOTIS-GIT/turtlebot3_msgs.git
git clone https://github.com/ROBOTIS-GIT/turtlebot3.git
git clone https://github.com/ROBOTIS-GIT/turtlebot3_simulations.git
# Install dependencies for TurtleBot3
sudo apt-get install ros-noetic-dynamixel-sdk
sudo apt-get install ros-noetic-turtlebot3-msgs
sudo apt-get install ros-noetic-turtlebot3

sudo apt-get update
sudo apt-get upgrade


# Source the workspace
echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc
echo "export TURTLEBOT3_MODEL=burger" >> ~/.bashrc
echo "export TURTLEBOT3_MODEL=waffle_pi" >> ~/.bashrc
echo "alias python=python3" >> ~/.bashrc

sudo apt-get install ros-noetic-slam-gmapping
sudo apt-get install ros-noetic-dwa-local-planner

# Install TurtleBot3 simulation packages
sudo apt install -y ros-noetic-turtlebot3-simulations
source ~/.bashrc
# Done!
echo "ROS Noetic with TurtleBot3 installed successfully!"

# Instructions to Run:
# chmod +x install_ros.sh
# ./install_ros.sh
