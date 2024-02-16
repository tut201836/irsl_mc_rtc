irsl_docker_irsl_system/run.sh \
    --image irsl_system_mcrtc:noetic \
    --workspace `pwd`/userdir \
    --no-gpu \
    --ros-ip 127.0.0.1 \
    --ros-master-uri http://127.0.0.1:11311