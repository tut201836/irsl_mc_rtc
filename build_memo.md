# Docker構築メモ
## 構築の前提
- 動作ユーザーはrootとする
    - BaselineWalkingController周りのソースのpermissionの扱いがめんどくさいが，そのほかの設定ファイルがもっとめんどくさいので一旦目をつぶる．
- 開発対象はBaselineWalkingControllerのみ
    - mc_rtc等ををいじることはしない．

## 詳細メモ
+ ボリュームマウントは以下の２つ
    - \<git repo\>/bwc_ws -> /bwc_ws 
        - BaselineWalkingController用
    - \<git repo\>/config/_\<Robot Name\>_/mc_rtc.yaml -> /root/.config/mc_rtc/mc_rtc.yaml
        - mc_rtc設定用
        - JVRC1とCHIDORIで切り替えができるようにしている
+ 動作用ソース等の保存先は以下の４つ
    - /mc_rtc_ws (mc_rtc用 イメージ内)
    - /ros_ws (ros用 イメージ内)
    - /log_format (log_format イメージ内)
    - /bwc_ws (mc_rtc用 イメージ外にありボリュームマウント)

+  ワークスペースのカスケード順
    実行時のsource実施については，/root/.bashrcに記載してある．
    1. /opt/ros/noetic/setup.bash (aptで入れたROSパッケージ)
    1. /mc_rtc_ws/src/catkin_ws/devel/setup.bash (mc_rtc_ws内のパッケージ用)
    1. /ros_ws/devel/setup.bash　(ros_ws内のパッケージ:log_plotter用)
    1. /bwc_ws/devel/setup.bash　(bwc_ws内のパッケージ:BaselineWalkingController用)
    
+ ディレクトリ構成（抜粋） 
    ```
    /mc_rtc_ws/
    ├── build
    ├── install
    │   ├── bin
    │   ├── etc
    │   ├── include
    │   ├── lib
    │   │   ├── choreonoid-2.2
    │   │   ├── cmake
    │   │   ├── mc_controller
    │   │   ├── mc_observers
    │   │   ├── mc_plugins
    │   │   ├── mc_robots
    │   │   ├── openrtm-1.1
    │   │   ├── pkgconfig
    │   │   ├── python2.7
    │   │   │   └── dist-packages
    │   │   └── python3.8
    │   │       ├── dist-packages
    │   │       └── site-packages (mc_log_uiのためにPYTHONPATHを通す先)
    │   └── share
    │       ├── OpenHRP-3.1
    │       ├── applications
    │       ├── choreonoid
    │       ├── choreonoid-2.2
    │       ├── cmake
    │       ├── doc
    │       ├── hrpsys
    │       │   └── samples (ロボット毎のsim_mc.cnoid等がある場所)
    │       ├── icons
    │       ├── locale
    │       ├── man
    │       ├── ndcurves
    │       └── openrtm-1.1
    ├── mc-rtc-superbuild
    │   ├── build
    │   ├── cmake
    │   ├── extensions
    │   │   ├── chidori-superbuild
    │   │   └── superbuild-choreonoid-irsl
    │   ├── robots
    │   ├── src
    │   └── utils
    └── src
        ├── 3rd-party
        ├── Eigen3ToPython
        ├── RBDyn
        ├── SpaceVecAlg
        ├── Tasks
        ├── catkin_data_ws
        │   ├── build
        │   ├── devel
        │   └── src
        ├── catkin_ws
        │   ├── build
        │   ├── devel (sourceする必要のある先)
        │   ├── logs
        │   └── src
        ├── choreonoid
        ├── eigen-qld
        ├── eigen-quadprog
        ├── gram_savitzky_golay
        ├── hrpcnoid_chidori
        ├── lexls
        ├── mc_chidori
        ├── mc_openrtm
        ├── mc_rtc
        ├── mc_state_observation
        ├── mc_udp
        ├── ndcurves
        ├── openhrp
        ├── pybind11
        ├── sch-core
        ├── sch-core-python
        ├── state-observation
        └── tvm
    ```
    ```
    /ros_ws
    ├── build
    │   └── log_plotter
    ├── devel    (sourceする必要のある先)
    ├── logs
    └── src
        └── log_plotter
    ```
    ```
    /bwc_ws
    ├── build
    ├── devel (sourceする必要のある先)
    ├── logs
    └── src
        └── isri-aist
            ├── BaselineFootstepPlanner
            ├── BaselineWalkingController
            ├── CentroidalControlCollection
            ├── ForceControlCollection
            ├── NMPC
            ├── QpSolverCollection
            └── TrajectoryCollection
    ```
