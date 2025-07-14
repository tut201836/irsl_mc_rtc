import yaml
import random
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

def create_joint(i, j, joint_width, x_joint_count, z_joint_count):
    """ジョイントデータを生成する"""
    joint_name = f"joint{i}_{j}"
    translation_value = [i * 0.5, 0, j * joint_width]
    shape_translation = [0.3 + i * joint_width, 0, (-joint_width * 0.5) + j * (-joint_width)]

    # 色の設定
    if (i + j) % 2 == 0:
        diffuse_color = [0, 0.49, 0.49]
        emissive_color = [0, 0.21, 0.21]
    else:
        diffuse_color = [0, 0, 0.49]
        emissive_color = [0, 0, 0.21]

    # 波状の高さ
    wave_amplitude = 0.0
    wave_frequency = 0.0
    height_variation = wave_amplitude * math.sin(wave_frequency * i) * math.cos(wave_frequency * j)

    # ジョイントの種類
    if random.choice([True, False]):
        joint_type = "revolute"
        joint_axis = [random.randint(0, 1), random.randint(0, 1), random.randint(0, 1)]
        joint_range = [-3.14, 3.14]
    else:
        joint_type = "prismatic"
        joint_axis = [0, 1, 0]
        joint_range = [-0.1, 0.1]

    # ジョイントデータ
    joint = {
        "name": joint_name,
        "elements": [
            {
                "type": "Transform",
                "rotation": [-1, 0, 0, 90],
                "translation": [0.1 + (-i * 0.51), height_variation, (j * (joint_width + 0.01)) - (0.5 * joint_width * z_joint_count)],
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
                                    "size": [joint_width, joint_width, joint_width],
                                },
                            }
                        ],
                    }
                ],
            }
        ],
        "parent": "Base",
        "translation": translation_value,
        "rotation": [1, 0, 0, 90],
        "joint_name": joint_name,
        "joint_type": joint_type,
        "joint_axis": joint_axis,
        "joint_id": i,
        "joint_range": joint_range,
        "joint_axis_inertia": 1,
        "mass": 0.005,
        "center_of_mass": [1.0 + (-i * 0.5), height_variation, (j * joint_width) - (z_joint_count * joint_width * 0.5)],
        "inertia": [
            0.0420833, 0, 0,
            0, 0.00427083, -8.32667e-19,
            0, -8.32667e-19, 0.000520833,
        ],
    }

    return joint

def create_spring_setting(joint_name, joint_range):
    """スプリング設定を生成する"""
    return {
        "joint_name": joint_name,
        "K": random.uniform(2000, 2000),
        "D": random.uniform(2000, 2000),
        "upper_limit": joint_range[1],
        "lower_limit": joint_range[0],
        "velocity_limit": 20.0,
    }

def generate_choreonoid_body(x_joint_count, z_joint_count, joint_width):
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
        for j in range(z_joint_count):
            joint = create_joint(i, j, joint_width, x_joint_count, z_joint_count)
            body_data["links"].append(joint)

    return body_data

def generate_spring_settings(x_joint_count, z_joint_count):
    """SpringCustomizerSettings.yamlデータを生成する"""
    spring_settings = {"springs": []}

    for i in range(x_joint_count):
        for j in range(z_joint_count):
            joint_name = f"joint{i}_{j}"
            joint_range = [-3.14, 3.14] if random.choice([True, False]) else [-0.1, 0.1]
            spring_setting = create_spring_setting(joint_name, joint_range)
            spring_settings["springs"].append(spring_setting)

    return spring_settings

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
    x_joint_count = 15
    z_joint_count = 5
    joint_width = 0.3
    body_filename = "step_floor.body"
    spring_filename = "SpringCustomizerSettings.yaml"

    body_data = generate_choreonoid_body(x_joint_count, z_joint_count, joint_width)
    spring_settings = generate_spring_settings(x_joint_count, z_joint_count)

    save_to_yaml(body_data, body_filename)
    save_to_yaml(spring_settings, spring_filename)

if __name__ == "__main__":
    main()
