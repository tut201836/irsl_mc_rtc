#!/bin/bash

iname=${DOCKER_IMAGE:-"repo.irsl.eiiris.tut.ac.jp/irsl_system:noetic "} ##
cname=${DOCKER_CONTAINER:-"docker_irsl_system"} ## name of container (should be same as in exec.sh)

DEFAULT_USER_DIR="$(pwd)"
mtdir=${MOUNTED_DIR:-$DEFAULT_USER_DIR}

_ROS_SETUP=${DOCKER_ROS_SETUP:-"/choreonoid_ws/install/setup.bash"}

VAR=${@:-"bash"}
if [ $# -eq 0 -a -z "$OPT" ]; then
    OPT=-it
fi

if [ -z "$NO_GPU" ]; then
    GPU_OPT='--gpus all,"capabilities=compute,graphics,utility,display"'
else
    GPU_OPT=""
fi
#echo "GPU_OPT: $GPU_OPT"

## --net=mynetworkname
## docker inspect -f '{{.NetworkSettings.Networks.mynetworkname.IPAddress}}' container_name
## docker inspect -f '{{.NetworkSettings.Networks.mynetworkname.Gateway}}'   container_name

NET_OPT="--net=host"
# for gdb
#NET_OPT="--net=host --env=DOCKER_ROS_IP --env=DOCKER_ROS_MASTER_URI --cap-add=SYS_PTRACE --security-opt=seccomp=unconfined"

DOCKER_ENVIRONMENT_VAR=""

if [ -n "$USE_USER" ]; then
    USER_SETTING=" -u $(id -u):$(id -g) -v /etc/passwd:/etc/passwd:ro -v /etc/group:/etc/group:ro"
fi

_ROS_IP=${ARG_ROS_IP:-"localhost"}
_ROS_MASTER_URI=${ARG_ROS_MASTER_URI:-"http://localhost:11311"}

##xhost +local:root
xhost +si:localuser:root

rmimage=$(docker rm ${cname})

set -x

docker run \
    --privileged     \
    ${OPT}           \
    ${GPU_OPT}       \
    ${NET_OPT}       \
    ${USER_SETTING}  \
    ${DOCKER_OPTION} \
    ${DOCKER_ENVIRONMENT_VAR} \
    --env="DOCKER_ROS_SETUP=${_ROS_SETUP}" \
    --env="ROS_IP=${_ROS_IP}" \
    --env="ROS_MASTER_URI=${_ROS_MASTER_URI}" \
    --env="DISPLAY"  \
    --env="QT_X11_NO_MITSHM=1" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    --name=${cname} \
    --volume="${mtdir}:/userdir" \
    -w="/userdir" \
    -- ${iname} \
    ${VAR}

##    --env="JUPYTER_PATH=/choreonoid_ws/install/share/choreonoid-2.0/jupyter" \
##    --env="PYTHONPATH=/choreonoid_ws/install/lib/choreonoid-2.0/python" \
##xhost -local:root

## capabilities
# compute	CUDA / OpenCL アプリケーション
# compat32	32 ビットアプリケーション
# graphics	OpenGL / Vulkan アプリケーション
# utility	nvidia-smi コマンドおよび NVML
# video		Video Codec SDK
# display	X11 ディスプレイに出力
# all
