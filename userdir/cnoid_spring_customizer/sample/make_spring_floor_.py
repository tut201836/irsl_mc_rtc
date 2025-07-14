import yaml
import math
import random

def create_base_link():
    """Baseリンクを生成する"""
    return {
        "name": "Base",
        "elements": [
            {
                "type": "Transform",
                "elements": [
                    {
                        "type": "Transform",
                        "translation": [-2.3, 0, -0.05],
                        "elements": [
                            {
                                "type": "Shape",
                                "appearance": {
                                    "material": {
                                        "diffuse": [0.14, 0, 0.35],
                                        "emissive": [0.06, 0, 0.15],
                                    }
                                },
                                "geometry": {
                                    "type": "Box",
                                    "size": [5, 10, 0.1],
                                },
                            }
                        ],
                    }
                ],
            }
        ],
        "joint_name": "Base",
        "joint_type": "free",
        "mass": 5000,
        "center_of_mass": [-2.5, 0, -0.05],
        "inertia": [
            41670.8, 0, 0,
            0, 10420.8, 0,
            0, 0, 10833.3,
        ],
    }

def create_joint(i, step_floor_type, spring_floor_number, joint_width):
    """ジョイントデータを生成する"""
    joint_name = f"joint{i}"
    translation_value = [0.15 + (i * (joint_width*0.36)), 0, 0]
    shape_translation = [0.15 + (i * (joint_width*0.36)), 0, -0.5]

    fixed_angle = 90
    fixed_angle_2 = 0
    fixed_angle_3 = 90
    joint_range = [1, -1]

    if i == spring_floor_number:
        if step_floor_type == 0:
            joint_type = "prismatic"
        if step_floor_type == 1:
            joint_type = "fixed"
            fixed_angle = 10
            fixed_angle_2 = 10
            fixed_angle_3 = 0
        if step_floor_type == 2:
            joint_type = "revolute"
            joint_range = [-math.radians(30), math.radians(30)]

    else:
        joint_type = "fixed"

    # 色の設定
    if i == spring_floor_number:
        diffuse_color = [0, 0.49, 0.49]
        emissive_color = [0, 0.21, 0.21]
    else:
        diffuse_color = [0.49, 0.49, 0.49]
        emissive_color = [0.21, 0.21, 0.21]

    # ジョイントデータ
    joint = {
        "name": joint_name,
        "elements": [
            {
                "type": "Transform",
                "rotation": [-1, 0, 0, fixed_angle],
                "translation": translation_value,
                "elements": [
                    {
                        "type": "Transform",
                        "translation": shape_translation,
                        "elements": [
                            {
                                "type": "Shape",
                                "appearance": {
                                    "material": {
                                        "diffuse": diffuse_color,
                                        "emissive": emissive_color,
                                    }
                                },
                                "geometry": {
                                    "type": "Box",
                                    "size": [joint_width, 10, 1],
                                },
                            }
                        ],
                    }
                ],
            }
        ],
        "parent": "Base",
        "translation": translation_value,
        "rotation": [1, 0, fixed_angle_2, fixed_angle_3],
        "joint_name": joint_name,
        "joint_type": joint_type,
        "joint_axis": [0, 1, 0],
        "joint_id": i,
        "joint_range": joint_range,
        "joint_axis_inertia": 1,
        "mass": 0.005,
        "center_of_mass": [translation_value[0], -0.5, -1.11022e-16],
        "inertia": [
            0.0420833, 0, 0,
            0, 0.00427083, -8.32667e-19,
            0, -8.32667e-19, 0.000520833,
        ],
    }

    return joint

def create_spring_setting(joint_name, K, D):
    """スプリング設定を生成する"""
    return {
        "joint_name": joint_name,
        "K": K,
        "D": D,
        "upper_limit": 1.0,
        "lower_limit": -1.0,
        "velocity_limit": 20.0,
    }

def generate_choreonoid_body(x_joint_count, joint_width, step_floor_type, spring_floor_number, K, D):
    """Choreonoid Bodyファイルデータを生成する"""
    body_data = {
        "format": "ChoreonoidBody",
        "format_version": 2.0,
        "angle_unit": "degree",
        "name": "step_floor",
        "root_link": "Base",
        "links": [create_base_link()],
    }

    spring_settings = {"springs": []}

    for i in range(x_joint_count):
        joint = create_joint(i, step_floor_type, spring_floor_number, joint_width)
        body_data["links"].append(joint)
        spring_settings["springs"].append(create_spring_setting(f"joint{i}", K, D))

    return body_data, spring_settings

def save_to_yaml(data, filename):
    """データをYAMLファイルに保存する"""
    try:
        with open(filename, "w") as file:
            yaml.dump(data, file, default_flow_style=False, sort_keys=False, indent=2)
        print(f"'{filename}' を生成しました。")
    except Exception as e:
        print(f"ファイルの生成中にエラーが発生しました: {e}")

def main():
    """メイン関数"""
    x_joint_count = 5  # ジョイントの数
    joint_width = 0.4  # ジョイントの幅
    K = 4700  # バネ定数
    D = 1000  # ダンピング定数
    step_floor_type = 0
    spring_floor_number = 1

    body_filename = "step_floor.body"
    spring_filename = "SpringCustomizerSettings.yaml"

    body_data, spring_settings = generate_choreonoid_body(x_joint_count, joint_width, step_floor_type, spring_floor_number, K, D)

    save_to_yaml(body_data, body_filename)
    save_to_yaml(spring_settings, spring_filename)

if __name__ == "__main__":
    main()
