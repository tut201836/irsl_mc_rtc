import yaml

def generate_step_config(steps, translation_step, swing_height):
    """各ステップの設定を生成する（両足を揃える歩行設定）"""
    step_list = []
    for i in range(steps):
        # 両足が同じ位置に移動する
        step_config_left = {
            "foot": "Left",
            "footMidpose": {
                "translation": [translation_step * (i + 1), 0.0, 0.0],
            },
            "swingTrajConfig": {
                "type": "CubicSplineSimple",
                "withdrawOffset": [0, 0, swing_height],
                "approachOffset": [0, 0, swing_height * 0.625],
                "swingOffset": [0, 0, swing_height],
            },
        }
        step_config_right = {
            "foot": "Right",
            "footMidpose": {
                "translation": [translation_step * (i + 1), 0.0, 0.0],
            },
            "swingTrajConfig": {
                "type": "CubicSplineSimple",
                "withdrawOffset": [0, 0, swing_height],
                "approachOffset": [0, 0, swing_height * 0.625],
                "swingOffset": [0, 0, swing_height],
            },
        }
        # 左足と右足の設定を1ステップに追加
        step_list.append(step_config_left)
        step_list.append(step_config_right)
    return step_list

def generate_walk_config(steps, translation_step, swing_height, footstep_duration, double_support_ratio):
    """歩行設定を生成する"""
    walk_config = {
        "CoMTask": {
            "activeJoints": [
                "Root",
                "LLEG_JOINT0", "LLEG_JOINT1", "LLEG_JOINT2", "LLEG_JOINT3", "LLEG_JOINT4", "LLEG_JOINT5",
                "RLEG_JOINT0", "RLEG_JOINT1", "RLEG_JOINT2", "RLEG_JOINT3", "RLEG_JOINT4", "RLEG_JOINT5"
            ]
        },
        "BaseOrientationTask": {
            "frame": "BODY"
        },
        "FootManager": {
            "footstepDuration": footstep_duration,
            "doubleSupportRatio": double_support_ratio,
            "deltaTransLimit": [0.2, 0.05, 7.5],
            "impedanceGains": {
                "SingleSupport": {
                    "spring": {
                        "linear": [2250, 2250, 450]
                    }
                }
            }
        },
        "CentroidalManager": {
            "useActualStateForMpc": True,
            "enableZmpFeedback": False,
            "useTargetPoseForControlRobotAnchorFrame": True,
            "useActualComForWrenchDist": False,
            "dcmGainP": 1.5,
            "comZGainP": 20000.0,
            "zmpVelGain": 0.02,
            "refComZ": 0.7039,
            "method": "PreviewControlZmp",
            "horizonDuration": 2.0,
            "horizonDt": 0.002
        },
        "transitions": [
            ["BWC::Initial_", "OK", "BWC::ConfigWalk_", "Auto"]
        ],
        "states": {
            "BWC::Initial_": {
                "base": "BWC::Initial",
                "configs": {
                    "autoStartTime": 2.0
                }
            },
            "BWC::ConfigWalk_": {
                "base": "BWC::ConfigWalk",
                "configs": {
                    "footstepList": generate_step_config(steps, translation_step, swing_height)
                }
            }
        }
    }
    return walk_config

def save_to_yaml(data, filename):
    """YAMLファイルに保存する"""
    try:
        with open(filename, "w") as file:
            yaml.dump(data, file, default_flow_style=False, sort_keys=False, indent=2)
        print(f"'{filename}' を生成しました。")
    except Exception as e:
        print(f"ファイルの生成中にエラーが発生しました: {e}")

def main():
    """メイン関数"""
    steps = 2  # ステップ数
    translation_step = 0.3  # 一歩の進む距離
    swing_height = 0.10  # 足のスイング高さ
    footstep_duration = 3.0  # 歩行速度（秒）
    double_support_ratio = 0.2  # 二重支持期の比率

    config = generate_walk_config(steps, translation_step, swing_height, footstep_duration, double_support_ratio)
    save_to_yaml(config, "BaselineWalkingController.yaml")

if __name__ == "__main__":
    main()
