#!/bin/bash -e

[ -d ~/source ] || mkdir -v ~/source
cd ~/source
git clone https://github.com/orocos/orocos_kinematics_dynamics
cd orocos_kinematics_dynamics/orocos_kdl && mkdir build && cd build
cmake ..
make -j
sudo make install
