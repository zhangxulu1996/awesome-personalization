#!/bin/bash

declare -A subject_with_cls=(
  ["backpack"]="backpack"
  ["backpack_dog"]="backpack"
  ["bear_plushie"]="stuffed animal"
  ["berry_bowl"]="bowl"
  ["can"]="can"
  ["candle"]="candle"
  ["cat"]="cat"
  ["cat2"]="cat"
  ["clock"]="clock"
  ["colorful_sneaker"]="sneaker"
  ["dog"]="dog"
  ["dog2"]="dog"
  ["dog3"]="dog"
  ["dog5"]="dog"
  ["dog6"]="dog"
  ["dog7"]="dog"
  ["dog8"]="dog"
  ["duck_toy"]="toy"
  ["fancy_boot"]="boot"
  ["grey_sloth_plushie"]="stuffed animal"
  ["monster_toy"]="toy"
  ["pink_sunglasses"]="glasses"
  ["poop_emoji"]="toy"
  ["rc_car"]="toy"
  ["red_cartoon"]="cartoon"
  ["robot_toy"]="toy"
  ["shiny_sneaker"]="sneaker"
  ["teapot"]="teapot"
  ["vase"]="vase"
  ["wolf_plushie"]="stuffed animal"
  ["elephant"]="animal statue"
  ["thin_bird"]="animal statue"
  ["physics_mug"]="mug"
  ["clock2"]="clock"
  ["colorful_teapot"]="teapot"
  ["round_bird"]="animal statue"
  ["red_teapot"]="teapot"
  ["cat_statue"]="animal statue"
  ["mug_skulls"]="mug"
  ["barn"]="barn"
  ["cat3"]="cat"
  ["teddybear"]="stuffed animal"
  ["tortoise_plushy"]="stuffed animal"
  ["wooden_pot"]="pot"
  ["chair"]="chair"
  ["flower"]="flower"
  ["table"]="table"
)

MODEL_NAME="CompVis/stable-diffusion-v1-4"

DATASET_DIR="../../pcs_dataset/subjects/"

for subject in "${!subject_with_cls[@]}"; do

  class=${subject_with_cls[$subject]}
  
  INSTANCE_DIR="$DATASET_DIR/$subject"

  CLASS_DIR="class_images/$class"

  accelerate launch --main_process_port=29519 \
  --gpu_ids=3 \
  train_custom_diffusion.py \
  --pretrained_model_name_or_path=$MODEL_NAME  \
  --instance_data_dir=$INSTANCE_DIR \
  --output_dir="../../logs/subjects/custom_diffusion/$subject" \
  --class_data_dir="$CLASS_DIR" \
  --with_prior_preservation --prior_loss_weight=1.0 \
  --class_prompt="$class" --num_class_images=200 \
  --instance_prompt="photo of a <new1> $class"  \
  --resolution=512  \
  --train_batch_size=2  \
  --learning_rate=1e-5  \
  --lr_warmup_steps=0 \
  --max_train_steps=500 \
  --checkpointing_steps=500 \
  --scale_lr --hflip  \
  --modifier_token "<new1>"

done