# irsl_mc_rtc

## build
```
./build.sh -u <GITLAB name> -e <GITLAB email> -k <GITLAB SSH PUBKEY>
./build_source.sh --init
```

## run
```
ROBOT=<CHIDORI or JVRC1> ./run.sh
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
./clear-omninames.sh
choreonoid sim_mc.cnoid --start-simulation
```

## START Walking and Walking by twist topic
```
rvizのGUI上で
BWCタブ -> START
teleopタブ -> StartTeleop
```

