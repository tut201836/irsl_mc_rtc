import yaml
import math

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

def create_joint(i, joint_width, fixed_angle=0):
    """ジョイントデータを生成する"""
    joint_name = f"joint{i}"
    translation_value = [0.15 + (i * (joint_width * 0.36)), 0, 0]
    shape_translation = [0.15 + (i * (joint_width * 0.36)), 0, -0.5]

    # 色の設定
    if i % 2 == 0:
        diffuse_color = [0, 0.49, 0.49]
        emissive_color = [0, 0.21, 0.21]
    else:
        diffuse_color = [0, 0, 0.49]
        emissive_color = [0, 0, 0.21]

    # 固定ジョイント設定
    joint_type = "fixed"  # 固定ジョイントに変更

    joint = {
        "name": joint_name,
        "elements": [
            {
                "type": "Transform",
                "rotation": [1, 0, 0, fixed_angle],  # 初期状態で傾きを設定
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
        "rotation": [1, 0, fixed_angle, 0],  # 初期状態で傾きを設定
        "joint_name": joint_name,
        "joint_type": joint_type,
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

def generate_choreonoid_body(x_joint_count, joint_width, fixed_angle=0):
    """Choreonoid Bodyファイルデータを生成する"""
    body_data = {
        "format": "ChoreonoidBody",
        "format_version": 2.0,
        "angle_unit": "degree",
        "name": "step_floor",
        "root_link": "Base",
        "links": [create_base_link()],
    }

    for i in range(x_joint_count):
        joint = create_joint(i, joint_width, fixed_angle)
        body_data["links"].append(joint)

    return body_data

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
    x_joint_count = 1  # ジョイントの数
    joint_width = 9.5  # ジョイントの幅
    fixed_angle = math.radians(50)  # 傾きを15度に固定

    body_filename = "step_floor.body"

    body_data = generate_choreonoid_body(x_joint_count, joint_width, fixed_angle)

    save_to_yaml(body_data, body_filename)

if __name__ == "__main__":
    main()
