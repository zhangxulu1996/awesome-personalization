#!/bin/bash

# 定义字典
id_list=("000001" "000181" "000268" "000612" "000667" "001603" "001854" "002088" "002464" "002782" "002880" "002929" "002937" "003785" "004153")

# 数据集根目录
DATASET_DIR="../../pcs_dataset/face"

# 遍历字典中的所有键值对
for id in "${id_list[@]}"; do
  
  # 设置数据目录
  DATA_DIR="$DATASET_DIR/$id/face.jpg"
  
  # 运行 accelerate launch 命令
  accelerate launch --main_process_port=29517 \
  --gpu_ids=2 \
  tuning_e4t.py \
  --pretrained_model_name_or_path="models" \
  --prompt_template="a photo of {placeholder_token}" \
  --reg_lambda=0.1 \
  --output_dir="../../logs/face/e4t/$id" \
  --train_image_path=$DATA_DIR\
  --resolution=512 \
  --train_batch_size=8 \
  --learning_rate=1e-6 --scale_lr \
  --max_train_steps=30 \
  --mixed_precision="fp16" \
  --enable_xformers_memory_efficient_attention

done


