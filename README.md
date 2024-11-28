# irsl_mc_rtc

## build
```
./build.sh -u <GITLAB name> -e <GITLAB email> -k <GITLAB SSH PUBKEY>
./run.sh ./build_controller.sh
./run.sh ./build_controller.sh # HOTFIX (シンボリックリンクが作られないことがあるため)
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

## How to simulate lattice floor
```
cd ~/userdir
source setup.bash
bash choreonoid_step.bash
```

## Make lattice floor
Lattice floor is generated in "userdir/cnoid_spring_customizer/sample/make_step_floor.py"
```
cd /userdir/cnoid_spring_customizer/sample
python make_step_floor.py
```

