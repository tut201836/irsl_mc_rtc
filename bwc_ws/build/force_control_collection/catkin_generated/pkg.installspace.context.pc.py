# generated from catkin/cmake/template/pkg.context.pc.in
CATKIN_PACKAGE_PREFIX = ""
PROJECT_PKG_CONFIG_INCLUDE_DIRS = "${prefix}/include;/usr/include/eigen3".split(';') if "${prefix}/include;/usr/include/eigen3" != "" else []
PROJECT_CATKIN_DEPENDS = "roscpp;qp_solver_collection".replace(';', ' ')
PKG_CONFIG_LIBRARIES_WITH_PREFIX = "-lForceColl".split(';') if "-lForceColl" != "" else []
PROJECT_NAME = "force_control_collection"
PROJECT_SPACE_DIR = "/bwc_ws/install"
PROJECT_VERSION = "0.2.0"
