docker build . -f Dockerfile.superbuild \
    --build-arg BASE_IMAGE=repo.irsl.eiiris.tut.ac.jp/irsl_system:noetic \
    --build-arg CATKIN_SETUP_FILE=/choreonoid_ws/install/setup.bash \
    -t irsl_system_mcrtc:noetic