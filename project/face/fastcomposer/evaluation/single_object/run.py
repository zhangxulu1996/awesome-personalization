import os,sys
sys.path.append(os.path.join(sys.path[0], '../..'))

from evaluation.single_object.data import get_combinations
from evaluation.pipeline import convert_model_to_pipeline
from fastcomposer.utils import parse_args
from accelerate.utils import set_seed
from accelerate import Accelerator
import torch
import glob 
import PIL
 


@torch.no_grad()
def main():
    args = parse_args(inference=True)
    accelerator = Accelerator(
        mixed_precision=args.mixed_precision,
    )

    # If passed along, set the seed now.
    if args.seed is not None:
        set_seed(args.seed)

    model = convert_model_to_pipeline(args, accelerator.device)
    model.safety_checker = None 

    unique_token = "img"

    prompt_subject_pairs = get_combinations(
        args.dataset_info_path, unique_token, is_fastcomposer=True
    )

    for case_id, (prompt_list, subject) in enumerate(prompt_subject_pairs):
        real_case_id = case_id + args.start_idx

        reference_image_path = sorted(
            glob.glob(
                os.path.join(args.dataset_name, subject, "*.jpg")
            )
        )[0]

        reference_image = PIL.Image.open(reference_image_path).convert("RGB")

        for prompt_id, prompt in enumerate(prompt_list):
            output_images = model(
                prompt=prompt,
                height=512,
                width=512,
                num_inference_steps=50,
                guidance_scale=5.0,
                num_images_per_prompt=args.num_images_per_prompt,
                alpha_=0.5,
                reference_subject_images=[reference_image],
            ).images


            for instance_id in range(args.num_images_per_prompt):
                file_path = os.path.join(args.output_dir, subject, f"prompt{prompt_id}")
                
                os.makedirs(file_path, exist_ok=True)

                output_images[instance_id].save(os.path.join(file_path, f"{instance_id:04d}.jpg"))


if __name__ == "__main__":
    main()