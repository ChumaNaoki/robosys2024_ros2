#!/bin/bash

source /opt/ros/humble/setup.bash
source /root/ros2_ws/install/setup.bash

source ~/ros2_ws/install/setup.bash

dir=~
[ "$1" != "" ] && dir="$1"

source /opt/ros/humble/setup.bash
source /root/ros2_ws/install/setup.bash


cd $dir/ros2_ws
colcon build
source $dir/.bashrc
timeout 8 ros2 launch mypkg talk_listen.launch.py > /tmp/mypkg.log
cat /tmp/mypkg.log |
grep '10角形の内角の和は: 1440°'
