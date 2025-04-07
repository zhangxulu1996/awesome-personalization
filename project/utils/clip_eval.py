import os
import numpy as np
import clip
import torch
from PIL import Image
from torchvision import transforms

class CLIPEvaluator(object):
    def __init__(self, device, clip_model='ViT-B/32') -> None:
        self.device = device
        self.model, clip_preprocess = clip.load(clip_model, device=self.device)

        self.preprocess = clip_preprocess
        
        # self.preprocess = transforms.Compose([transforms.Normalize(mean=[-1.0, -1.0, -1.0], std=[2.0, 2.0, 2.0])] + # Un-normalize from [-1.0, 1.0] (generator output) to [0, 1].
        #                                       clip_preprocess.transforms[:2] +                                      # to match CLIP input scale assumptions
        #                                       clip_preprocess.transforms[4:])                                       # + skip convert PIL to tensor

    def tokenize(self, strings: list):
        return clip.tokenize(strings).to(self.device)

    @torch.no_grad()
    def encode_text(self, tokens: list) -> torch.Tensor:
        return self.model.encode_text(tokens)

    @torch.no_grad()
    def encode_images(self, images) -> torch.Tensor:
        images = self.preprocess(images).unsqueeze(0).to(self.device)
        return self.model.encode_image(images)

    def get_text_features(self, text: str, norm: bool = True) -> torch.Tensor:

        tokens = clip.tokenize(text).to(self.device)

        text_features = self.encode_text(tokens).detach()

        if norm:
            text_features /= text_features.norm(dim=-1, keepdim=True)

        return text_features

    def get_image_features(self, img, norm: bool = True) -> torch.Tensor:
        image_features = self.encode_images(img)
        
        if norm:
            image_features /= image_features.clone().norm(dim=-1, keepdim=True)

        return image_features

    def img_to_img_similarity(self, generated_images, src_images=None, src_img_features=None):
        if src_img_features is None and src_images is not None:
            src_img_features = self.get_image_features(src_images)
        gen_img_features = self.get_image_features(generated_images)

        return (src_img_features @ gen_img_features.T).mean()

    def txt_to_img_similarity(self, generated_images, text=None, text_features=None):
        if text_features is None and text is not None:
            text_features = self.get_text_features(text)
        gen_img_features = self.get_image_features(generated_images)

        return (text_features @ gen_img_features.T).mean()


class ImageDirEvaluator(CLIPEvaluator):
    def __init__(self, device, clip_model='ViT-B/32') -> None:
        super().__init__(device, clip_model)

    def evaluate(self, gen_samples, src_images, target_text):

        sim_samples_to_img  = self.img_to_img_similarity(src_images, gen_samples)
        sim_samples_to_text = self.txt_to_img_similarity(target_text.replace("*", ""), gen_samples)

        return sim_samples_to_img, sim_samples_to_text


def evaluate_i2i(generate_img_path, source_img_path):
    device = torch.device("cuda") if torch.cuda.is_available() else torch.device("cpu")
    evaluator = CLIPEvaluator(device)

    generate_images = Image.open(generate_img_path)

    if os.path.isfile(source_img_path):
        src_images = Image.open(source_img_path)
        return evaluator.img_to_img_similarity(generate_images, src_images=src_images).cpu().numpy()
    else:
        similarity_score = []
        for file_name in os.listdir(source_img_path):
            if os.path.isfile(os.path.join(source_img_path, file_name)):
                src_images = Image.open(os.path.join(source_img_path, file_name))
                similarity_score.append(evaluator.img_to_img_similarity(generate_images, src_images=src_images).cpu().numpy())
        return np.mean(similarity_score)


def evaluate_t2i(generate_img_path, prompt):
    device = torch.device("cuda") if torch.cuda.is_available() else torch.device("cpu")
    evaluator = CLIPEvaluator(device)

    generate_images = Image.open(generate_img_path)

    return np.around(evaluator.txt_to_img_similarity(generate_images, text=prompt).cpu().numpy(), decimals=4)