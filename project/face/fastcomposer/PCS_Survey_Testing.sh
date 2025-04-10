CUDA_VISIBLE_DEVICES=0 python evaluation/single_object/single_object_evaluation.py \
    --prediction_folder  ../../outputs/face/fastcomposer \
    --reference_folder ../../pcs_dataset/face \
    --dataset_info_path ../../pcs_dataset/info.json
     