# generated from catkin/cmake/template/pkg.context.pc.in
CATKIN_PACKAGE_PREFIX = ""
PROJECT_PKG_CONFIG_INCLUDE_DIRS = "${prefix}/include;/usr/include/eigen3".split(';') if "${prefix}/include;/usr/include/eigen3" != "" else []
PROJECT_CATKIN_DEPENDS = "roscpp;geometry_msgs;trajectory_collection;force_control_collection;centroidal_control_collection".replace(';', ' ')
PKG_CONFIG_LIBRARIES_WITH_PREFIX = "-lBaselineWalkingController".split(';') if "-lBaselineWalkingController" != "" else []
PROJECT_NAME = "baseline_walking_controller"
PROJECT_SPACE_DIR = "/bwc_ws/install"
PROJECT_VERSION = "0.1.0"
