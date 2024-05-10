# irsl_mc_rtc

## build
```
./build.sh -u <GITLAB name> -e <GITLAB email> -k <GITLAB SSH PUBKEY>
./build_controller.sh --init
./build_controller.sh --build
```

## run
```
ROBOT=<CHIDORI or JVRC1> ./run.sh
roscore
```

## exec
```
./exec.sh
roslaunch mc_rtc_ticker display.launch
```

## exec
```
./exec.sh -w /mc_rtc_ws/install/share/hrpsys/samples/<ROBOT NAME>
choreonoid sim_mc.cnoid --start-simulation
```

## START Walking and Walking by twist topic
```
rvizのGUI上で
BWCタブ -> START
teleopタブ -> StartTeleop
```

