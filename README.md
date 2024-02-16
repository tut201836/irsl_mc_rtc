# choreonoid_test_env

## build
```
SSH_AUTH_SOCK=<github's ssh key file> ./build.sh
```

## run
```
./run.sh
roscore
```

## exec
```
./exec.sh
roslauch mc_rtc_ticker display.launch
```

## exec
```
./exec.sh
roslaunch choreonoid_ros choreonoid.launch choreonoid_arg:="/mc_rtc_ws/install/share/hrpsys/samples/CHIDORI/sim_mc.cnoid"
```

## START Walking and Walking by twist topic
```
rvizのGUI上で
BWCタブ -> START
teleopタブ -> StartTeleop
```

