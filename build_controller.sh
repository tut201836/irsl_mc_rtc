INIT=0
SETUPCONFIG=0
BUILD=0
REPOSITORY=isri-aist
COMMIT_SHA=master

iname=${DOCKER_IMAGE:-"irsl_mc_rtc:ubuntu20.04"}

while [[ $# -gt 0 ]]; do
    case $1 in
        --init)
            INIT=1
            shift
            ;;
        --build)
            BUILD=1
            shift
            ;;
        --help)
            echo "build.sh [--init] [--build]"
            exit 0
            ;;
        --)
            shift
            break
            ;;
        -*|--*)
            echo "Unknown option $1"
            exit 1
            ;;
        *)
            POSITIONAL_ARGS+=("$1") # save positional arg
            shift # past argument
            ;;
    esac
done

if [ $BUILD -eq 0 ] && [ $INIT -eq 0 ] &&  [ $SETUPCONFIG -eq 0 ]; then
    echo "Nothing to do"
    exit
fi

if [ $INIT -eq 1 ]; then
    # init process
    # git clone
    echo "source clone"
    mkdir -p ../root/catkin_ws/src
    docker run \
    --rm \
    -v `pwd`/root/catkin_ws:/root/catkin_ws \
    $iname \
    bash -c "cd /root/catkin_ws && wstool init src && \
    mkdir -p src/isri-aist/BaselineWalkingController && \
    cd src/isri-aist/BaselineWalkingController && \
    git init && \
    git remote add origin https://github.com/${REPOSITORY}/BaselineWalkingController && \
    git fetch origin ${COMMIT_SHA} && \
    git checkout ${COMMIT_SHA} && \
    git submodule update --init --recursive && \
    cd /root/catkin_ws && \
    wstool merge -t src src/isri-aist/BaselineWalkingController/depends.rosinstall && \
    wstool update -t src"
    
fi

if [ $BUILD -eq 1 ] || [ $INIT -eq 1 ]; then
    echo "build source"
    docker run \
        --rm \
        -v `pwd`/root/catkin_ws:/root/catkin_ws \
        -v `pwd`/root/config_JVRC1:/root/.config \
        $iname \
        bash -c 'apt update && \
        rosdep update && \
        source /opt/ros/noetic/setup.bash && \
        cd /root/catkin_ws && \
        rosdep install -y -r --from-paths src --ignore-src  && \
        source /workspace/src/catkin_ws/devel/setup.bash && \
        catkin build baseline_footstep_planner -DCMAKE_BUILD_TYPE=RelWithDebInfo && \
        PATH=/workspace/install/lib/cmake:$PATH catkin build baseline_walking_controller -DCMAKE_BUILD_TYPE=RelWithDebInfo -DENABLE_QLD=ON'
fi
