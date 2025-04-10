CUDA_VISIBLE_DEVICES=0 python evaluation/single_object/run.py \
    --finetuned_model_path model/pytorch_model.bin \
    --mixed_precision "fp16" \
    --dataset_name ../../pcs_dataset/face \
    --dataset_info_path ../../pcs_dataset/info.json\
    --seed 42 \
    --num_images_per_prompt 4 \
    --object_resolution 224 \
    --output_dir ../../outputs/face/fastcomposer
     