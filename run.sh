#!/bin/bash

iname=${DOCKER_IMAGE:-"irsl_mc_rtc:ubuntu20.04"} ##
cname=${DOCKER_CONTAINER:-"irsl_mc_rtc"} ## name of container (should be same as in exec.sh)
robot=${ROBOT:-"JVRC1"} # JVRC1 or CHIDORI
MC_RTC_WORKSPCE=/mc_rtc_ws

if [ $robot = "JVRC1" ]; then
    MC_CONTROL_CONFIG_MOUNT="--volume=`pwd`/config/JVRC1/mc_rtc.yaml:/root/.config/mc_rtc/mc_rtc.yaml"
elif [ $robot = "CHIDORI" ]; then
    MC_CONTROL_CONFIG_MOUNT="--volume=`pwd`/config/CHIDORI/mc_rtc.yaml:/root/.config/mc_rtc/mc_rtc.yaml"
fi
BWC_WORK_MOUNT="--volume=`pwd`/bwc_ws:/bwc_ws"

.irsl_docker_irsl_system/run.sh \
--image $iname \
--name $cname \
--mount ${MC_CONTROL_CONFIG_MOUNT} \
--mount ${BWC_WORK_MOUNT} \
--workspace "`pwd`/userdir"