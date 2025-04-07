CAPTION="a man <|image|> is reading book"
DEMO_NAME="demo"

HF_ENDPOINT=https://hf-mirror.com CUDA_VISIBLE_DEVICES=0 accelerate launch --main_process_port=29518 \
    --mixed_precision=fp16 \
    facediffuser/inference.py \
    --pretrained_model_name_or_path runwayml/stable-diffusion-v1-5  \
    --finetuned_model_path model/SDM \
    --finetuned_model_text_only_path model/TDM \
    --test_reference_folder data/${DEMO_NAME} \
    --test_caption "${CAPTION}" \
    --output_dir outputs/${DEMO_NAME} \
    --mixed_precision fp16 \
    --image_encoder_type clip \
    --image_encoder_name_or_path openai/clip-vit-large-patch14 \
    --num_image_tokens 1 \
    --max_num_objects 4 \
    --object_resolution 512 \
    --generate_height 512 \
    --generate_width 512 \
    --num_images_per_prompt 1 \
    --num_rows 1 \
    --seed 3407\
    --guidance_scale 5 \
    --inference_steps 50 \
    --start_merge_step 15 \
    --final_step 30 \
    --no_object_augmentation