# choreonoid_test_env

## build
```
./build.sh
```

## run
```
./run.sh
roscore
```

## exec
```
./exec.sh
source /mc_rtc_ws/src/catkin_ws/devel/setup.bash
roslauch mc_rtc_ticker display.launch
```

## exec
```
./exec.sh
source /mc_rtc_ws/src/catkin_ws/devel/setup.bash
cd /usr/share/hrpsys/samples/JVRC1
choreonoid sim_mc.cnoid
```

## START Walking and Walking by twist topic
```
rvizのGUI上で
BWCタブ -> START
teleopタブ -> StartTeleop
```

