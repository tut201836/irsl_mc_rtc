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
BWC_WORK_MOUNT="--volume=`pwd`/bwc_ws:/bwc_ws"

.irsl_docker_irsl_system/run.sh \
--image $iname \
--name $cname \
--mount ${MC_CONTROL_CONFIG_MOUNT} \
--mount ${BWC_WORK_MOUNT} \
--workspace "`pwd`/userdir" "$@"