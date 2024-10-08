#!/bin/bash
cname=${DOCKER_CONTAINER:-"irsl_mc_rtc"} ## name of container

.irsl_docker_irsl_system/exec.sh \
--name $cname --no-ros "$@"