#!/bin/bash

declare -A dict=(
    ["000001"]="man"
    ["000181"]="man"
    ["000268"]="man"
    ["000612"]="woman"
    ["000667"]="woman"
    ["001603"]="woman"
    ["001854"]="man"
    ["002088"]="woman"
    ["002464"]="woman"
    ["002782"]="man"
    ["002880"]="woman"
    ["002929"]="woman"
    ["002937"]="woman"
    ["003785"]="man"
    ["004153"]="woman"
)

prompts=(
    "a {0} {1} wearing a red hat"
    "a {0} {1} wearing a santa hat"
    "a {0} {1} wearing a rainbow scarf"
    "a {0} {1} wearing a black top hat and a monocle"
    "a {0} {1} in a chef outfit"
    "a {0} {1} in a firefighter outfit"
    "a {0} {1} in a police outfit"
    "a {0} {1} wearing pink glasses"
    "a {0} {1} wearing a yellow shirt"
    "a {0} {1} in a purple wizard outfit"
    "a {0} {1} in the jungle"
    "a {0} {1} in the snow"
    "a {0} {1} on the beach"
    "a {0} {1} on a cobblestone street"
    "a {0} {1} on top of pink fabric"
    "a {0} {1} on top of a wooden floor"
    "a {0} {1} with a city in the background"
    "a {0} {1} with a mountain in the background"
    "a {0} {1} with a blue house in the background"
    "a {0} {1} on top of a purple rug in a forest"
    "a {0} {1} riding a horse"
    "a {0} {1} holding a glass of wine"
    "a {0} {1} holding a piece of cake"
    "a {0} {1} giving a lecture"
    "a {0} {1} reading a book"
    "a {0} {1} gardening in the backyard"
    "a {0} {1} cooking a meal"
    "a {0} {1} working out at the gym"
    "a {0} {1} walking the dog"
    "a {0} {1} baking cookies"
    "a painting of a {0} {1} in the style of Banksy"
    "a painting of a {0} {1} in the style of Vincent Van Gogh"
    "a colorful graffiti painting of a {0} {1}"
    "a watercolor painting of a {0} {1}"
    "a Greek marble sculpture of a {0} {1}"
    "a street art mural of a {0} {1}"
    "a black and white photograph of a {0} {1}"
    "a pointillism painting of a {0} {1}"
    "a Japanese woodblock print of a {0} {1}"
    "a street art stencil of a {0} {1}"
)

total_tasks=$(( ${#dict[@]} * ${#prompts[@]} ))
current_task=0

print_progress_bar() {
    local progress=$(( $1 * 100 / $2 ))
    local done=$(( progress * 4 / 10 ))
    local left=$(( 40 - done ))
    local done_str=$(printf "%${done}s")
    local left_str=$(printf "%${left}s")
    printf "\rProgress : [${done_str// /#}${left_str// /-}] $progress%%"
}

for subject in "${!dict[@]}"; do
    value=${dict[$subject]}

    for prompt in "${prompts[@]}"; do
        prompt=$(echo $prompt | sed "s/{0}/$value/" | sed "s/{1}/<|image|>/")
        
        HF_ENDPOINT=https://hf-mirror.com CUDA_VISIBLE_DEVICES=0 accelerate launch --main_process_port=29518 \
            --mixed_precision=fp16 \
            facediffuser/inference.py \
            --pretrained_model_name_or_path runwayml/stable-diffusion-v1-5  \
            --finetuned_model_path model/SDM \
            --finetuned_model_text_only_path model/TDM \
            --test_reference_folder ../../pcs_dataset/face_for_facediffusers/${subject} \
            --test_caption "${prompt}" \
            --output_dir ../../outputs/face/face-diffuser/${subject} \
            --mixed_precision fp16 \
            --image_encoder_type clip \
            --image_encoder_name_or_path openai/clip-vit-large-patch14 \
            --num_image_tokens 1 \
            --max_num_objects 1 \
            --object_resolution 512 \
            --generate_height 512 \
            --generate_width 512 \
            --num_images_per_prompt 4 \
            --num_rows 1 \
            --seed 3407\
            --guidance_scale 5 \
            --inference_steps 50 \
            --start_merge_step 15 \
            --final_step 30 \
            --no_object_augmentation
        
        current_task=$((current_task + 1))
        print_progress_bar $current_task $total_tasks
    done
done

echo
