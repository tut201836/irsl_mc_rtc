FROM repo.irsl.eiiris.tut.ac.jp/irsl_system:noetic

ARG REPOSITORY=isri-aist
ARG COMMIT_SHA=master
ENV REPOSITORY ${REPOSITORY}
ENV COMMIT_SHA ${COMMIT_SHA}

# Install mc_rtc
RUN curl -1sLf 'https://dl.cloudsmith.io/public/mc-rtc/stable/setup.deb.sh' | bash
RUN apt update && \
    apt-get install -y libmc-rtc-dev mc-rtc-utils ros-noetic-mc-rtc-plugin ros-noetic-mc-rtc-tools ros-noetic-mc-rtc-rviz-panel libeigen-qld-dev &&\
    # https://github.com/jrl-umi3218/lipm_walking_controller/blob/b564d655388ae6a6725c504e5c74a62192e58c7c/.github/workflows/build.yml#L69
    apt-get install -y mc-state-observation jvrc-choreonoid xvfb ffmpeg mesa-utils fluxbox xserver-xorg xserver-xorg-core xserver-xorg-video-all libwayland-egl1-mesa && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

# Setup catkin workspace
ENV HOME /root
RUN mkdir -p ${HOME}/catkin_ws/src
WORKDIR ${HOME}/catkin_ws
RUN wstool init src
# To handle CI triggered by Pull Request, COMMIT_SHA must be specified in the git fetch argument,
# but since wstool does not support it, execute the git commands directly instead.
# RUN wstool set -t src BaselineWalkingController https://github.com/${REPOSITORY}/BaselineWalkingController --git -y -v ${COMMIT_SHA}
RUN mkdir -p src/isri-aist/BaselineWalkingController && \
    cd src/isri-aist/BaselineWalkingController && \
    git init && \
    git remote add origin https://github.com/${REPOSITORY}/BaselineWalkingController && \
    git fetch origin ${COMMIT_SHA} && \
    git checkout ${COMMIT_SHA} && \
    git submodule update --init --recursive
RUN wstool merge -t src src/isri-aist/BaselineWalkingController/depends.rosinstall
RUN wstool update -t src

# Rosdep install
RUN apt update && \
    rosdep update && \
    source /opt/ros/noetic/setup.bash && \
    rosdep install -y -r --from-paths src --ignore-src&& \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

# Catkin build
RUN source /opt/ros/${ROS_DISTRO}/setup.bash && catkin build baseline_footstep_planner -DCMAKE_BUILD_TYPE=RelWithDebInfo
RUN source ${HOME}/catkin_ws/devel/setup.bash && catkin build baseline_walking_controller -DCMAKE_BUILD_TYPE=RelWithDebInfo -DENABLE_QLD=ON
RUN echo "source ${HOME}/catkin_ws/devel/setup.bash" >> ${HOME}/.bashrc

# Setup simulation
WORKDIR ${HOME}
RUN mkdir -p ${HOME}/.config/mc_rtc/controllers
RUN cp ${HOME}/catkin_ws/src/isri-aist/BaselineWalkingController/etc/mc_rtc.yaml ${HOME}/.config/mc_rtc/mc_rtc.yaml

# RUN apt update && \
#     apt install -y ros-noetic-rviz ros-noetic-depth-image-proc && \
#     apt install -y ros-noetic-rviz ros-noetic-pcl-ros && \
#     apt clean && \
#     rm -rf /var/lib/apt/lists/*

# RUN python3 -m pip install scipy
# RUN python3 -m pip install matplotlib