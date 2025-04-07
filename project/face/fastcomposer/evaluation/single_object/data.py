import json

IMAGE_TO_GENDER_DEMO = {
    "bengio": "man",
    "einstein": "man",
    "feifei": "woman",
    "hinton": "man",
    "lecun": "man",
    "barbara": "woman",
    "newton": "man",
    "johnson": "woman"
}


def get_prompts(prompts, class_token, unique_token):
    return [i.format(unique_token, class_token) for i in prompts]


def get_combinations(dataset_info_path, unique_token, is_fastcomposer=False):

    with open(dataset_info_path, 'r') as file:
        data_info = json.load(file)
        
    image_to_gender_dict = data_info["face"]["id_with_gender"]

    prompt_accessory = data_info["face"]["prompt_accessory"]
    prompt_style = data_info["face"]["prompt_style"]
    prompt_context = data_info["face"]["prompt_context"]
    prompt_action = data_info["face"]["prompt_action"]

    images = list(image_to_gender_dict.keys())

    prompt_pairs = []

    for subject_name in sorted(images):
        class_token = image_to_gender_dict[subject_name]
        if is_fastcomposer:
            # fastcomposer swaps the order of class_token and unique_token
            all_prompts = (
                get_prompts(prompt_accessory, unique_token, class_token)
                + get_prompts(prompt_context, unique_token, class_token)
                + get_prompts(prompt_action, unique_token, class_token)
                + get_prompts(prompt_style, unique_token, class_token)
            )
        else:
            all_prompts = (
                get_prompts(prompt_accessory, class_token, unique_token)
                + get_prompts(prompt_context, class_token, unique_token)
                + get_prompts(prompt_action, class_token, unique_token)
                + get_prompts(prompt_style, class_token, unique_token)
            )

        prompt_pairs.append((all_prompts, subject_name))

    return prompt_pairs
