#!/bin/bash -e

# Install ROS
echo "install ros kinetic"
ROS_DIST=kinetic
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 0xB01FA116
sudo sh -c '. /etc/lsb-release && echo "deb http://mirrors.tuna.tsinghua.edu.cn/ros/ubuntu/ $DISTRIB_CODENAME main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt update
sudo apt install -y ros-$ROS_DIST-desktop-full
sudo rosdep init
rosdep update
sudo apt install -y python-rosinstall
echo "source /opt/ros/$ROS_DIST/setup.bash" >> ~/.bashrc
echo "source /opt/ros/$ROS_DIST/setup.zsh" >> ~/.zshrc

echo "install extra ros package"
sudo apt install -y ros-$ROS_DIST-navigation ros-$ROS_DIST-joy ros-$ROS_DIST-ros-control ros-$ROS_DIST-people-msgs gstreamer1.0-pocketsphinx
