#!/bin/bash

iname="irsl_mc_rtc:ubuntu20.04" ##
cname="irsl_mc_rtc" ## name of container (should be same as in exec.sh)
robot=${ROBOT:-"JVRC1"} # JVRC1 or CHIDORI

if [ $robot = "JVRC1" ]; then
    MC_CONTROL_CONFIG_MOUNT="--volume=`pwd`/config/JVRC1/mc_rtc.yaml:/root/.config/mc_rtc/mc_rtc.yaml"
elif [ $robot = "CHIDORI" ]; then
    MC_CONTROL_CONFIG_MOUNT="--volume=`pwd`/config/CHIDORI/mc_rtc.yaml:/root/.config/mc_rtc/mc_rtc.yaml"
else 
    echo "$ROBOT is not defined."
    exit
fi

if [ -e "config/CHIDORI/chidori.yaml" ] && [ $robot = "CHIDORI" ] ; then
    ROBOT_CONFIG_MOUNT="--mount --volume=`pwd`/config/CHIDORI/chidori.yaml:/mc_rtc_ws/install/lib/mc_controller/BaselineWalkingController/chidori.yaml"
else 
    ROBOT_CONFIG_MOUNT=""
fi 

if [ -e "config/CHIDORI/BaselineWalkingController.yaml" ] && [ $robot = "CHIDORI" ] ; then
    ROBOT_CONFIG_MOUNT="--mount --volume=`pwd`/config/CHIDORI/BaselineWalkingController.yaml:/root/.config/mc_rtc/controllers/BaselineWalkingController.yaml"
else 
    ROBOT_CONFIG_MOUNT=""
fi 

BWC_WORK_MOUNT="--volume=`pwd`/bwc_ws:/bwc_ws"

.irsl_docker_irsl_system/run.sh \
--image $iname \
--name $cname \
--mount ${MC_CONTROL_CONFIG_MOUNT} \
--mount ${BWC_WORK_MOUNT} \
--workspace "`pwd`/userdir" "$@"