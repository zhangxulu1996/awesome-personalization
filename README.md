<center>

# Awesome Personalization

</center>

![example](assets/example.gif)

This repository contains a collection of papers and resources on ***Personalized Content Synthesis (PCS) with Diffusion Model***.

* We release **a survey** about personalized content synthesis. You can find it from [arXiv](https://arxiv.org/abs/2405.05538).
* We release **a unified test** dataset for image PCS task, see [Unified Test Dataset](#unified-test-dataset).
* We **uniformly evaluated** the performance of several existing open-source methods, see [Evaluation]().
* We **collected**, **organized**, and **categorized** the existing papers related to the PCS, see [Paper List](#paper-list).

# 🔗 Citation
**If you find the information in our paper useful for your research, please consider citing it in your work. Thank you!**

```text
@misc{zhang2024survey,
      title={A Survey on Personalized Content Synthesis with Diffusion Models}, 
      author={Xulu Zhang and Xiao-Yong Wei and Wengyu Zhang and Jinlin Wu and Zhaoxiang Zhang and Zhen Lei and Qing Li},
      year={2024},
      eprint={2405.05538},
      archivePrefix={arXiv},
      primaryClass={cs.CV}
}
```

# Contents
- [Unified Test Dataset](#unified-test-dataset)
- [Evaluation](#evaluation)
- [Paper List](#paper-list)
  - [Personalized Subject Generation](#personalized-subject-generation)
  - [Multi-concept Composition](#multi-concept-composition)
  - [Personalized Style Generation](#personalized-style-generation)
  - [Personalized Face Generation](#personalized-face-generation)
  - [Personalization with Extra Condition](#personalization-with-extra-condition)
  - [Personalized Video Generation](#personalized-video-generation)
  - [Personalized 3D Generation](#personalized-3d-generation)
  - [Others](#others)
- [Contect Us](#contact-us)

# Unified Test Dataset
To uniformly evaluate Personalized Content Synthesis (PCS) tasks, we introduces a comprehensive evaluation dataset designed for the most common
personalized generation tasks, **object** and **face** personalization.

Download Link: [PCS-dataset](https://drive.google.com/file/d/1WuEx29UWAZC18rz-raiglf14CR0DvA3G/view?usp=drive_link)


# Evaluation

We evaluate existing representative PCS methods based our unified test dataset. The evaluation results and settings are shown in the below table. For more details, please see our [survey paper](https://arxiv.org/abs/2405.05538).

| Type   | Methods             | Framework | Backbone      | CLIP-T    | CLIP-I    |
| ------ | ------------------- | --------- | ------------- | --------- | --------- |
| Object | Textual Inversion   | TTF       | SD 1.5        | 0.199     | 0.749     |
|        | Dreambooth          | TTF       | SD 1.5        | 0.286     | 0.772     |
|        | P+                  | TTF       | SD 1.4        | 0.244     | 0.643     |
|        | Custom Diffusion    | TTF       | SD 1.4        | 0.307     | 0.722     |
|        | NeTI                | TTF       | SD 1.4        | 0.283     | 0.801     |
|        | SVDiff              | TTF       | SD 1.5        | 0.282     | 0.776     |
|        | Perfusion           | TTF       | SD 1.5        | 0.273     | 0.691     |
|        | ELITE               | PTA       | SD 1.4        | 0.292     | 0.765     |
|        | BLIP-Diffusion      | PTA       | SD 1.5        | 0.292     | 0.772     |
|        | IP-Adapter          | PTA       | SD 1.5        | 0.272     | **0.825** |
|        | SSR Encoder         | PTA       | SD 1.5        | 0.288     | 0.792     |
|        | MoMA                | PTA       | SD 1.5        | 0.322     | 0.748     |
|        | Diptych Prompting   | PTA       | FLUX 1.0 dev  | **0.327** | 0.722     |
|        | λ-eclipse           | PTA       | Kandinsky 2.2 | 0.272     | 0.824     |
|        | MS-Diffusion        | PTA       | SDXL          | 0.298     | 0.777     |
| Face   | CrossInitialization | TTF       | SD 2.1        | 0.261     | 0.469     |
|        | Face2Diffusion      | PTA       | SD 1.4        | 0.265     | 0.588     |
|        | SSR Encoder         | PTA       | SD 1.5        | 0.233     | 0.490     |
|        | FastComposer        | PTA       | SD 1.5        | 0.230     | 0.516     |
|        | IP-Adapter          | PTA       | SD 1.5        | 0.292     | 0.462     |
|        | IP-Adapter          | PTA       | SDXL          | 0.292     | 0.642     |
|        | PhotoMaker          | PTA       | SDXL          | **0.311** | 0.547     |
|        | InstantID           | PTA       | SDXL          | 0.278     | **0.707** |
> _TTF: Test-time Fine-tuning_, _PTA: Pre-trained Adaptation_

# Paper List
## Personalized Object Generation

| Title | Venue | Date | Links |
|-------|-------|------|-------|
| An Image is Worth One Word: Personalizing Text-to-Image Generation using Textual Inversion | ICLR 2023 | 2022-08-02 | [Code](https://github.com/rinongal/textual_inversion) / [Paper](https://arxiv.org/pdf/2208.01618) |
| DreamBooth: Fine-Tuning Text-to-Image Diffusion Models for Subject-Driven Generation | CVPR 2023 | 2022-08-25 | [Code](https://dreambooth.github.io) / [Paper](https://arxiv.org/pdf/2208.12242) |
| Re-Imagen: Retrieval-Augmented Text-to-Image Generator | ICLR 2023 | 2022-09-29 | — / [Paper](https://arxiv.org/pdf/2209.14491) |
| Versatile Diffusion: Text, Images, and Variations All in One Diffusion Model | ICCV 2023 | 2022-11-15 | [Code](https://github.com/SHI-Labs/Versatile-Diffusion) / [Paper](https://arxiv.org/pdf/2211.08332) |
| DreamArtist: Towards Controllable One-Shot Text-to-Image Generation via Positive-Negative Prompt-Tuning | arXiv 2022 | 2022-11-21 | [Code](https://github.com/IrisRainbowNeko/DreamArtist-stable-diffusion) / [Paper](https://arxiv.org/pdf/2211.11337) |
| Is This Loss Informative? Faster Text-to-Image Customization by Tracking Objective Dynamics | NeurIPS 2023 | 2023-02-09 | [Code](https://github.com/yandex-research/DVAR) / [Paper](https://arxiv.org/pdf/2302.04841) |
| Encoder-Based Domain Tuning for Fast Personalization of Text-to-Image Models | ACM Trans on Graphics | 2023-02-23 | [Code](https://tuning-encoder.github.io) / [Paper](https://arxiv.org/pdf/2302.12228) |
| ELITE: Encoding Visual Concepts into Textual Embeddings for Customized Text-to-Image Generation | ICCV 2023 | 2023-02-27 | [Code](https://github.com/csyxwei/ELITE) / [Paper](https://arxiv.org/pdf/2302.13848) |
| Highly Personalized Text Embedding for Image Manipulation by Stable Diffusion | arXiv | 2023-03-15 | [Code](https://github.com/HiPer0/HiPer) / [Paper](https://arxiv.org/pdf/2303.08767) |
| Unified Multi-Modal Latent Diffusion for Joint Subject and Text Conditional Image Generation | arXiv | 2023-03-16 | — / [Paper](https://arxiv.org/pdf/2303.09319) |
| P+: Extended Textual Conditioning in Text-to-Image Generation | arXiv | 2023-03-16 | [Code](https://prompt-plus.github.io) / [Paper](https://arxiv.org/pdf/2303.09522) |
| A Closer Look at Parameter-Efficient Tuning in Diffusion Models | arXiv | 2023-03-31 | [Code](https://github.com/Xiang-cd/unet-finetune) / [Paper](https://arxiv.org/pdf/2303.18181) |
| Subject-Driven Text-to-Image Generation via Apprenticeship Learning | NIPS 2023 | 2023-04-01 | — / [Paper](https://arxiv.org/pdf/2304.00186) |
| Taming Encoder for Zero Fine-Tuning Image Customization with Text-to-Image Diffusion Models | arXiv | 2023-04-05 | — / [Paper](https://arxiv.org/pdf/2304.02642) |
| InstantBooth: Personalized Text-to-Image Generation Without Test-Time Finetuning | arXiv | 2023-04-06 | [Code](https://jshi31.github.io/InstantBooth/) / [Paper](https://arxiv.org/pdf/2304.03411) |
| Controllable Textual Inversion for Personalized Text-to-Image Generation | arXiv | 2023-04-11 | [Code](https://github.com/jnzju/COTI) / [Paper](https://arxiv.org/pdf/2304.05265) |
| Gradient-Free Textual Inversion | ACM MM 2023 | 2023-04-12 | [Code](https://github.com/feizc/Gradient-Free-Textual-Inversion) / [Paper](https://arxiv.org/pdf/2304.05818) |
| Personalize Segment Anything Model with One Shot | ICLR 2024 | 2023-05-04 | [Code](https://github.com/ZrrSkywalker/Personalize-SAM) / [Paper](https://arxiv.org/pdf/2305.03048) |
| DisenBooth: Identity-Preserving Disentangled Tuning for Subject-Driven Text-to-Image Generation | ICLR 2024 | 2023-05-05 | [Code](https://disenbooth.github.io) / [Paper](https://arxiv.org/pdf/2305.03374) |
| BLIP-Diffusion: Pre-Trained Subject Representation for Controllable Text-to-Image Generation and Editing | NIPS 2023 | 2023-05-24 | [Code](https://github.com/salesforce/LAVIS/tree/main/projects/blip-diffusion) / [Paper](https://arxiv.org/pdf/2305.14720) |
| A Neural Space-Time Representation for Text-to-Image Personalization | SIGGRAPH Asia 2023 | 2023-05-24 | [Code](https://github.com/NeuralTextualInversion/NeTI) / [Paper](https://arxiv.org/pdf/2305.15391) |
| Prospect: Prompt Spectrum for Attribute-Aware Personalization of Diffusion Models | ACM Trans on Graphics | 2023-05-25 | [Code](https://github.com/zyxElsa/ProSpect) / [Paper](https://arxiv.org/pdf/2305.16225) |
| Break-a-Scene: Extracting Multiple Concepts from a Single Image | SIGGRAPH ASIA 2023 | 2023-05-25 | [Code](https://github.com/google/break-a-scene) / [Paper](https://arxiv.org/pdf/2305.16311) |
| COMCAT: Towards Efficient Compression and Customization of Attention-Based Vision Models | arXiv | 2023-05-26 | [Code](https://github.com/jinqixiao/ComCAT) / [Paper](https://arxiv.org/pdf/2305.17235) |
| ViCo: Plug-and-Play Visual Condition for Personalized Text-to-Image Generation | arXiv | 2023-06-01 | [Code](https://github.com/haoosz/ViCo) / [Paper](https://arxiv.org/pdf/2306.00971) |
| Controlling Text-to-Image Diffusion by Orthogonal Fine-Tuning | arXiv | 2023-06-12 | [Code](https://github.com/Zeju1997/oft) / [Paper](https://arxiv.org/pdf/2306.07280) |
| Domain-Agnostic Tuning-Encoder for Fast Personalization of Text-to-Image Models | SIGGRAPH 2023 | 2023-07-13 | [Code](https://datencoder.github.io) / [Paper](https://arxiv.org/pdf/2307.06925) |
| IP-Adapter: Text Compatible Image Prompt Adapter for Text-to-Image Diffusion Models | arXiv | 2023-08-13 | [Code](https://github.com/tencent-ailab/IP-Adapter) / [Paper](https://arxiv.org/pdf/2308.06721) |
| Navigating Text-to-Image Customization: From Lycoris Fine-Tuning to Model Evaluation | ICLR 2024 | 2023-09-26 | [Code](https://github.com/kohakublueleaf/lycoris) / [Paper](https://arxiv.org/pdf/2309.14859) |
| Kosmos-G: Generating Images in Context with Multimodal Large Language Models | arXiv | 2023-10-04 | [Code](https://github.com/microsoft/unilm/blob/master/kosmos-g/README.md) / [Paper](https://arxiv.org/pdf/2310.02992) |
| Personalized Text-to-Image Model Enhancement Strategies: SOD Preprocessing and CNN Local Feature Integration | arXiv | 2023-10-26 | — / [Paper](https://www.mdpi.com/2079-9292/12/22/4707/pdf?version=1700390123) |
| A Data Perspective on Enhanced Identity Preservation for Diffusion Personalization | ICLR 2024 | 2023-11-07 | [Code](https://xingzhehe.github.io) / [Paper](https://arxiv.org/pdf/2311.04315.pdf) |
| DIFFNAT: Improving Diffusion Image Quality Using Natural Image Statistics | arXiv | 2023-11-16 | — / [Paper](https://arxiv.org/pdf/2311.09753) |
| An Image is Worth Multiple Words: Multi-attribute Inversion for Constrained Text-to-Image Synthesis | arXiv | 2023-11-20 | — / [Paper](https://arxiv.org/pdf/2311.11919) |
| LEGO: Learning to Disentangle and Invert Concepts Beyond Object Appearance in Text-to-Image Diffusion Models | arXiv | 2023-11-23 | [Code](https://github.com/sam-motamed/Lego) / [Paper](https://arxiv.org/pdf/2311.13833) |
| Catversion: Concatenating Embeddings for Diffusion-Based Text-to-Image Personalization | arXiv | 2023-11-24 | [Code](https://github.com/RoyZhao926/CatVersion) / [Paper](https://arxiv.org/pdf/2311.14631) |
| CLiC: Concept Learning in Context | CVPR 2024 | 2023-11-28 | [Code](https://github.com/Mehdi0xC/clic) / [Paper](https://arxiv.org/pdf/2311.17083) |
| HiFi Tuner: High-Fidelity Subject-Driven Fine-Tuning for Diffusion Models | arXiv | 2023-11-30 | — / [Paper](https://arxiv.org/pdf/2312.00079) |
| InstructBooth: Instruction-Following Personalized Text-to-Image Generation | arXiv | 2023-12-04 | — / [Paper](https://arxiv.org/pdf/2312.03011) |
| Customization Assistant for Text-to-Image Generation | CVPR 2024 | 2023-12-05 | — / [Paper](https://arxiv.org/pdf/2312.03045) |
| Decoupled Textual Embeddings for Customized Image Generation | AAAI 2024 | 2023-12-19 | [Code](https://github.com/PrototypeNx/DETEX) / [Paper](https://arxiv.org/pdf/2312.11826) |
| Towards Accurate Guided Diffusion Sampling through Symplectic Adjoint Method | arXiv | 2023-12-19 | [Code](https://github.com/hanshuyan/adjointdpm) / [Paper](https://arxiv.org/pdf/2312.12030) |
| DreamDistribution: Prompt Distribution Learning for Text-to-Image Diffusion Models | arXiv | 2023-12-21 | [Code](https://github.com/briannlongzhao/DreamDistribution) / [Paper](https://arxiv.org/pdf/2312.14216) |
| DreamTuner: Single Image is Enough for Subject-Driven Generation | arXiv | 2023-12-21 | [Code](https://dreamtuner-diffusion.github.io/) / [Paper](https://arxiv.org/pdf/2312.13691) |
| BootPIG: Bootstrapping Zero-Shot Personalized Image Generation Capabilities in Pretrained Diffusion Models | arXiv | 2024-01-25 | — / [Paper](https://arxiv.org/pdf/2401.13974) |
| Object-Driven One-Shot Fine-Tuning of Text-to-Image Diffusion with Prototypical Embedding | arXiv | 2024-01-28 | — / [Paper](https://arxiv.org/pdf/2401.15708) |
| DisenDreamer: Subject-Driven Text-to-Image Generation with Sample-aware Disentangled Tuning | arXiv | 2024-02-26 | — / [Paper](https://ieeexplore.ieee.org/abstract/document/10445245) |
| Infusion: Preventing Customized Text-to-Image Diffusion from Overfitting | arXiv | 2024-04-22 | — / [Paper](https://arxiv.org/abs/2404.14007) |
| Customizing Text-to-Image Models with a Single Image Pair | arXiv | 2024-05-02 | — / [Paper](https://arxiv.org/abs/2405.01536) |


## Multi-concept Composition

| Title | Venue | Date | Links |
|-------|-------|------|-------|
| Multi-Concept Customization of Text-to-Image Diffusion | CVPR 2023 | 2022-12-08 | [Code](https://github.com/adobe-research/custom-diffusion) / [Paper](https://arxiv.org/pdf/2212.04488) |
| CONES: Concept Neurons in Diffusion Models for Customized Generation | ICML 2023 | 2023-03-09 | [Code](https://github.com/Johanan528/Cones) / [Paper](https://arxiv.org/pdf/2303.05125) |
| SVDiff: Compact Parameter Space for Diffusion Fine-Tuning | ICCV 2023 | 2023-03-20 | [Code](https://svdiff.github.io) / [Paper](https://arxiv.org/pdf/2303.11305) |
| Key-Locked Rank One Editing for Text-to-Image Personalization | SIGGRAPH 2023 | 2023-05-02 | — / [Paper](https://arxiv.org/pdf/2305.01644) |
| Mix-of-Show: Decentralized Low-Rank Adaptation for Multi-Concept Customization of Diffusion Models | NIPS 2023 | 2023-05-29 | [Code](https://github.com/TencentARC/Mix-of-Show) / [Paper](https://arxiv.org/pdf/2305.18292) |
| CONES 2: Customizable Image Synthesis with Multiple Subjects | NIPS 2023 | 2023-05-30 | [Code](https://github.com/ali-vilab/Cones-V2) / [Paper](https://arxiv.org/pdf/2305.19327) |
| Generate Anything Anywhere in Any Scene | arXiv | 2023-06-29 | [Code](https://yuheng-li.github.io/PACGen/) / [Paper](https://arxiv.org/pdf/2306.17154) |
| AnyDoor: Zero-Shot Object-Level Image Customization | arXiv | 2023-07-18 | [Code](https://github.com/ali-vilab/AnyDoor) / [Paper](https://arxiv.org/pdf/2307.09481) |
| Subject-Diffusion: Open Domain Personalized Text-to-Image Generation Without Test-Time Fine-Tuning | arXiv | 2023-07-21 | [Code](https://github.com/OPPO-Mente-Lab/Subject-Diffusion) / [Paper](https://arxiv.org/pdf/2307.11410) |
| CustomNet: Zero-Shot Object Customization with Variable-Viewpoints in Text-to-Image Diffusion Models | arXiv | 2023-10-30 | [Code](https://jiangyzy.github.io/CustomNet/) / [Paper](https://arxiv.org/pdf/2310.19784) |
| Compositional Inversion for Stable Diffusion Models | AAAI 2024 | 2023-12-13 | [Code](https://github.com/zhangxulu1996/Compositional-Inversion) / [Paper](https://arxiv.org/pdf/2312.08048) |
| Visual Concept-Driven Image Generation with Text-to-Image Diffusion Model | arXiv | 2024-02-18 | — / [Paper](https://arxiv.org/pdf/2402.11487) |
| MIGC: Multi-Instance Generation Controller for Text-to-Image Synthesis | arXiv | 2024-02-27 | — / [Paper](https://arxiv.org/abs/2402.05408) |
| Multi-Object Editing in Personalized Text-To-Image Diffusion Model Via Segmentation Guidance | arXiv | 2024-03-18 | — / [Paper](https://ieeexplore.ieee.org/abstract/document/10447048) |
| MC2: Multi-concept Guidance for Customized Multi-concept Generation | arXiv | 2024-04-12 | — / [Paper](https://arxiv.org/pdf/2404.05268) |
| MultiBooth: Towards Generating All Your Concepts in an Image from Text | arXiv | 2024-04-22 | — / [Paper](https://arxiv.org/abs/2404.14239) |
| MagicTailor: Component-Controllable Personalization in Text-to-Image Diffusion Models | arXiv | 2024-10-06 | [Code](https://github.com/Correr-Zhou/MagicTailor) / [Paper](https://arxiv.org/pdf/2410.13370) |


## Personalized Style Generation

| Title | Venue | Date | Links |
|-------|-------|------|-------|
| StyleDrop: Text-to-Image Synthesis of Any Style | NIPS 2023 | 2023-06-01 | [Code](https://styledrop.github.io) / [Paper](https://arxiv.org/pdf/2306.00983) |
| StyleAdapter: A Single-Pass LoRA-Free Model for Stylized Image Generation | ICLR 2024 | 2023-09-04 | — / [Paper](https://arxiv.org/pdf/2309.01770) |
| StyleBoost: A Study of Personalizing Text-to-Image Generation in Any Style using DreamBooth | ICTC 2023 | 2023-10-13 | — / [Paper](https://www.google.com/url?sa=t&source=web&rct=j&opi=89978449&url=https://2023.ictc.org/media%3Fkey%3Dsite/ictc2023a/abs/C1-3.pdf&ved=2ahUKEwiavNzigI-FAxUik1YBHUOYD5wQFnoECBEQAQ&usg=AOvVaw0wUO0Av2FQ8ECKI-nZqkvw) |
| ArtAdapter: Text-to-Image Style Transfer Using Multi-Level Style Encoder and Explicit Adaptation | arXiv | 2023-12-04 | [Code](https://github.com/cardinalblue/ArtAdapter) / [Paper](https://arxiv.org/pdf/2312.02109) |
| Style Aligned Image Generation via Shared Attention | CVPR 2024 | 2023-12-04 | [Code](https://github.com/google/style-aligned) / [Paper](https://arxiv.org/pdf/2312.02133) |
| Generative Active Learning for Image Synthesis Personalization | arXiv | 2024-03-22 | [Code](https://github.com/zhangxulu1996/GAL4Personalization) / [Paper](https://arxiv.org/abs/2403.14987) |
| Text-to-Image Synthesis for Any Artistic Styles: Advancements in Personalized Artistic Image Generation via Subdivision and Dual Binding | arXiv | 2024-04-08 | — / [Paper](https://arxiv.org/pdf/2404.05256) |


## Personalized Face Generation

| Title | Venue | Date | Links |
|-------|-------|------|-------|
| Identity Encoder for Personalized Diffusion | CoRR 2023 | 2023-04-14 | — / [Paper](https://arxiv.org/pdf/2304.07429) |
| FastComposer: Tuning-Free Multi-Subject Image Generation with Localized Attention | CoRR 2023 | 2023-05-21 | [Code](https://github.com/mit-han-lab/fastcomposer) / [Paper](https://arxiv.org/pdf/2305.10431) |
| Enhancing Detail Preservation for Customized Text-to-Image Generation: A Regularization-Free Approach | arXiv | 2023-05-23 | — / [Paper](https://arxiv.org/pdf/2305.13579) |
| Inserting Anybody in Diffusion Models via Celeb Basis | NIPS 2023 | 2023-06-01 | [Code](https://github.com/ygtxr1997/CelebBasis) / [Paper](https://arxiv.org/pdf/2306.00926) |
| Face0: Instantaneously Conditioning a Text-to-Image Model on a Face | SIGGRAPH 2023 | 2023-06-11 | — / [Paper](https://arxiv.org/pdf/2306.06638) |
| DreamIdentity: Improved Editability for Efficient Face-Identity Preserved Image Generation | arXiv | 2023-07-01 | [Code](https://github.com/DreamIdentity/DreamIdentity.github.io/tree/main) / [Paper](https://arxiv.org/pdf/2307.00300) |
| HyperDreamBooth: Hypernetworks for Fast Personalization of Text-to-Image Models | arXiv | 2023-07-13 | [Code](https://hyperdreambooth.github.io) / [Paper](https://arxiv.org/pdf/2307.06949) |
| Identity-Preserving Aging of Face Images via Latent Diffusion Models | IJCB 2023 | 2023-07-17 | [Code](https://github.com/sudban3089/ID-Preserving-Facial-Aging) / [Paper](https://arxiv.org/pdf/2307.08585) |
| Magicapture: High-Resolution Multi-Concept Portrait Customization | arXiv | 2023-09-13 | [Code](https://github.com/junhahyung/MagiCapture) / [Paper](https://arxiv.org/pdf/2309.06895) |
| High-Fidelity Person-Centric Subject-to-Image Synthesis | CVPR 2024 | 2023-11-17 | — / [Paper](https://arxiv.org/pdf/2311.10329) |
| When StyleGAN Meets Stable Diffusion: A W+ Adapter for Personalized Image Generation | arXiv | 2023-11-29 | [Code](https://github.com/AyanKumarBhunia/w-plus-adapter) / [Paper](https://arxiv.org/pdf/2311.17461) |
| Portrait Diffusion: Training-Free Face Stylization with Chain-of-Painting | arXiv | 2023-12-03 | [Code](https://github.com/liujin112/PortraitDiffusion) / [Paper](https://arxiv.org/pdf/2312.02212) |
| Retrieving Conditions from Reference Images for Diffusion Models | arXiv | 2023-12-05 | — / [Paper](https://arxiv.org/pdf/2312.02521) |
| FaceStudio: Put Your Face Everywhere in Seconds | arXiv | 2023-12-05 | [Code](https://github.com/TencentQQGYLab/FaceStudio) / [Paper](https://arxiv.org/pdf/2312.02663) |
| Personalized Face Inpainting with Diffusion Models by Parallel Visual Attention | WACV 2024 | 2023-12-06 | [Code](https://github.com/AtlantixJJ/PVA-CelebAHQ-IDI) / [Paper](https://arxiv.org/pdf/2312.03556) |
| PhotoMaker: Customizing Realistic Human Photos via Stacked ID Embedding | arXiv | 2023-12-07 | [Code](https://photo-maker.github.io) / [Paper](https://arxiv.org/pdf/2312.04461) |
| DemoCaricature: Democratising Caricature Generation with a Rough Sketch | CVPR 2024 | 2023-12-07 | [Code](https://github.com/ChenDarYen/DemoCaricature) / [Paper](https://arxiv.org/pdf/2312.04364) |
| Stellar: Systematic Evaluation of Human-Centric Personalized Text-to-Image Methods | CoRR 2023 | 2023-12-11 | [Code](https://stellar-gen-ai.github.io) / [Paper](https://arxiv.org/pdf/2312.06116) |
| PortraitBooth: A Versatile Portrait Model for Fast Identity-Preserved Personalization | CVPR 2024 | 2023-12-11 | [Code](https://portraitbooth.github.io) / [Paper](https://arxiv.org/pdf/2312.06354) |
| Concept-Centric Personalization with Large-Scale Diffusion Priors | arXiv | 2023-12-13 | [Code](https://github.com/PRIV-Creation/Concept-centric-Personalization) / [Paper](https://arxiv.org/pdf/2312.08195) |
| Cross Initialization for Personalized Text-to-Image Generation | arXiv | 2023-12-26 | [Code](https://github.com/lyupang/crossinitialization) / [Paper](https://arxiv.org/pdf/2312.15905) |
| InstantID: Zero-Shot Identity-Preserving Generation in Seconds | arXiv | 2024-01-15 | [Code](https://github.com/InstantID/InstantID) / [Paper](https://arxiv.org/pdf/2401.07519) |
| Face2Diffusion for Fast and Editable Face Personalization | arXiv | 2024-03-08 | — / [Paper](https://arxiv.org/abs/2403.05094) |
| OMG: Occlusion-friendly Personalized Multi-concept Generation in Diffusion Models | arXiv | 2024-03-16 | [Code](https://github.com/kongzhecn/OMG/) / [Paper](https://arxiv.org/abs/2403.10983) |
| Infinite-ID: Identity-preserved Personalization via ID-semantics Decoupling Paradigm | arXiv | 2024-03-18 | — / [Paper](https://arxiv.org/abs/2403.11781) |
| IDAdapter: Learning Mixed Features for Tuning-Free Personalization of Text-to-Image Models | arXiv | 2024-03-21 | — / [Paper](https://arxiv.org/abs/2403.13535) |
| MoA: Mixture-of-Attention for Subject-Context Disentanglement in Personalized Image Generation | arXiv | 2024-04-17 | — / [Paper](https://arxiv.org/abs/2404.11565) |
| ID-Aligner: Enhancing Identity-Preserving Text-to-Image Generation with Reward Feedback Learning | arXiv | 2024-04-23 | — / [Paper](https://arxiv.org/abs/2404.15449) |
| InstantFamily: Masked Attention for Zero-shot Multi-ID Image Generation | arXiv | 2024-04-30 | — / [Paper](https://arxiv.org/abs/2404.19427) |


## Personalization with Extra Condition

| Title | Venue | Date | Links |
|-------|-------|------|-------|
| Training-free layout control with cross-attention guidance | WACV 2024 | 2023-04-06 | [Code](https://github.com/silent-chen/layout-guidance) / [Paper](https://arxiv.org/abs/2304.03373) |
| Prompt-Free Diffusion: Taking "Text" Out of Text-to-Image Diffusion Models | CVPR 2024 | 2023-05-25 | [Code](https://github.com/SHI-Labs/Prompt-Free-Diffusion) / [Paper](https://arxiv.org/pdf/2305.16223) |
| Uni-ControlNet: All-in-One Control to Text-to-Image Diffusion Models | NeurIPS 2023 | 2023-05-25 | [Code](https://github.com/ShihaoZhaoZSH/Uni-ControlNet) / [Paper](https://arxiv.org/pdf/2305.16322) |
| PhotoSwap: Personalized Subject Swapping in Images | NIPS 2023 | 2023-05-29 | [Code](https://github.com/eric-ai-lab/photoswap) / [Paper](https://arxiv.org/pdf/2305.18286) |
| TryonDiffusion: A Tale of Two UNets | CVPR 2023 | 2023-06-14 | [Code](https://tryondiffusion.github.io) / [Paper](https://arxiv.org/pdf/2306.08276) |
| ViscoNet: Bridging and Harmonizing Visual and Textual Conditioning for ControlNet | arXiv | 2023-12-05 | [Code](https://github.com/soon-yau/visconet) / [Paper](https://arxiv.org/pdf/2312.03154) |
| Context Diffusion: In-Context Aware Image Generation | arXiv | 2023-12-06 | [Code](https://ivonajdenkoska.github.io/contextdiffusion/main.html) / [Paper](https://arxiv.org/pdf/2312.03584) |
| FreeControl: Training-Free Spatial Control of Any Text-to-Image Diffusion Model with Any Condition | CVPR 2024 | 2023-12-12 | [Code](https://github.com/genforce/freecontrol) / [Paper](https://arxiv.org/pdf/2312.07536) |
| A Two-Stage Personalized Virtual Try-On Framework with Shape Control and Texture Guidance | CoRR 2023 | 2023-12-24 | — / [Paper](https://arxiv.org/pdf/2312.15480) |
| Tuning-Free Image Customization with Image and Text Guidance | arXiv | 2024-03-19 | — / [Paper](https://arxiv.org/abs/2403.12658) |
| SWAPANYTHING: Enabling Arbitrary Object Swapping in Personalized Visual Editing | arXiv | 2024-04-08 | — / [Paper](https://arxiv.org/abs/2404.05717) |
| Customizing Text-to-Image Diffusion with Camera Viewpoint Control | arXiv | 2024-04-18 | — / [Paper](https://arxiv.org/abs/2404.12333) |


## Personalized Video Generation

| Title | Venue | Date | Links |
|-------|-------|------|-------|
| Tune-A-Video: One-Shot Tuning of Image Diffusion Models for Text-to-Video Generation | ICCV 2023 | 2022-12-22 | [Code](https://github.com/showlab/Tune-A-Video) / [Paper](https://arxiv.org/abs/2212.11565) |
| Structure and Content-Guided Video Synthesis with Diffusion Models | ICCV 2023 | 2023-02-06 | — / [Paper](https://openaccess.thecvf.com/content/ICCV2023/papers/Esser_Structure_and_Content-Guided_Video_Synthesis_with_Diffusion_Models_ICCV_2023_paper.pdf) |
| Make-A-Protagonist: Generic Video Editing with Visual and Textual Clues | arXiv | 2023-05-15 | [Code](https://github.com/HeliosZhao/Make-A-Protagonist) / [Paper](https://arxiv.org/abs/2305.08850) |
| Animate-A-Story: Storytelling with Retrieval-Augmented Video Generation | arXiv | 2023-07-13 | [Code](https://videocrafter.github.io/Animate-A-Story) / [Paper](https://arxiv.org/abs/2307.06940) |
| MotionDirector: Motion Customization of Text-to-Video Diffusion Models | arXiv | 2023-10-12 | [Code](https://github.com/showlab/MotionDirector) / [Paper](https://arxiv.org/pdf/2310.08465) |
| LAMP: Learn a Motion Pattern for Few-Shot-Based Video Generation | arXiv | 2023-10-16 | [Code](https://github.com/guspan-tanadi/LAMPbyRQ-Wu) / [Paper](https://arxiv.org/pdf/2310.10769) |
| VideoDreamer: Customized Multi-Subject Text-to-Video Generation with Disen-Mix Finetuning | arXiv | 2023-11-02 | [Code](https://github.com/videodreamer23/videodreamer23.github.io) / [Paper](https://arxiv.org/abs/2311.00990) |
| VideoAssembler: Identity-Consistent Video Generation with Reference Entities Using Diffusion Model | arXiv | 2023-11-29 | [Code](https://github.com/gulucaptain/videoassembler) / [Paper](https://arxiv.org/pdf/2311.17338) |
| VMC: Video Motion Customization using Temporal Attention Adaption for Text-to-Video Diffusion Models | arXiv | 2023-12-01 | [Code](https://github.com/HyeonHo99/Video-Motion-Customization) / [Paper](https://arxiv.org/abs/2312.00845) |
| VideoBooth: Diffusion-Based Video Generation with Image Prompts | CVPR 2024 | 2023-12-01 | [Code](https://github.com/Vchitect/VideoBooth) / [Paper](https://arxiv.org/pdf/2312.00777) |
| StyleCrafter: Enhancing Stylized Text-to-Video Generation with Style Adapter | arXiv | 2023-12-01 | [Code](https://github.com/GongyeLiu/StyleCrafter) / [Paper](https://arxiv.org/pdf/2312.00330) |
| SAVE: Protagonist Diversification with Structure Agnostic Video Editing | arXiv | 2023-12-05 | [Code](https://github.com/ldynx/SAVE/blob/main/README.md) / [Paper](https://arxiv.org/pdf/2312.02503) |
| Customizing Motion in Text-to-Video Diffusion Models | arXiv | 2023-12-07 | [Code](https://joaanna.github.io/customizing_motion/) / [Paper](https://arxiv.org/pdf/2312.04966) |
| DreamVideo: Composing Your Dream Videos with Customized Subject and Motion | arXiv | 2023-12-07 | [Code](https://dreamvideo-t2v.github.io/) / [Paper](https://arxiv.org/abs/2312.04433) |
| MotionCrafter: One-Shot Motion Customization of Diffusion Models | arXiv | 2023-12-08 | [Code](https://github.com/zyxElsa/MotionCrafter) / [Paper](https://arxiv.org/pdf/2312.05288) |
| DreaMoving: A Human Video Generation Framework Based on Diffusion Models | arXiv | 2023-12-08 | [Code](https://github.com/dreamoving/dreamoving-project) / [Paper](https://arxiv.org/pdf/2312.05107) |
| CustomVideo: Customizing Text-to-Video Generation with Multiple Subjects | arXiv | 2024-01-18 | [Code](https://kyfafyd.wang/projects/customvideo/) / [Paper](https://arxiv.org/abs/2401.09962) |
| Magic-Me: Identity-Specific Video Customized Diffusion | arXiv | 2024-02-14 | — / [Paper](https://arxiv.org/abs/2402.09368) |
| Customize-A-Video: One-Shot Motion Customization of Text-to-Video Diffusion Models | arXiv | 2024-02-22 | — / [Paper](https://arxiv.org/abs/2402.14780) |
| ID-Animator: Zero-Shot Identity-Preserving Human Video Generation | arXiv | 2024-04-23 | — / [Paper](https://arxiv.org/abs/2404.15275) |

## Personalized 3D Generation

| Title | Venue | Date | Links |
|-------|-------|------|-------|
| Magic3D: High-Resolution Text-to-3D Content Creation | CVPR 2023 | 2022-11-18 | [Code](https://github.com/chinhsuanwu/dreamfusionacc) / [Paper](https://openaccess.thecvf.com/content/CVPR2023/papers/Lin_Magic3D_High-Resolution_Text-to-3D_Content_Creation_CVPR_2023_paper.pdf) |
| DreamBooth3D: Subject-Driven Text-to-3D Generation | ICCV 2023 | 2023-03-23 | [Code](https://dreambooth3d.github.io/) / [Paper](https://openaccess.thecvf.com/content/ICCV2023/papers/Raj_DreamBooth3D_Subject-Driven_Text-to-3D_Generation_ICCV_2023_paper.pdf) |
| Text-Conditional Contextualized Avatars For Zero-Shot Personalization | arXiv | 2023-04-14 | — / [Paper](https://arxiv.org/abs/2304.07410) |
| StyleAvatar3D: Leveraging Image-Text Diffusion Models for High-Fidelity 3D Avatar Generation | arXiv | 2023-05-30 | — / [Paper](https://arxiv.org/abs/2305.19012) |
| AvatarBooth: High-Quality and Customizable 3D Human Avatar Generation | arXiv | 2023-06-16 | [Code](https://zeng-yifei.github.io/avatarbooth_page/) / [Paper](https://arxiv.org/abs/2306.09864) |
| MVDREAM: MULTI-VIEW DIFFUSION FOR 3D GENERATION | ICLR 2024 | 2023-08-31 | [Code](https://github.com/bytedance/MVDream) / [Paper](https://arxiv.org/abs/2308.16512) |
| Chasing Consistency in Text-to-3D Generation from a Single Image | arXiv | 2023-09-07 | — / [Paper](https://arxiv.org/abs/2309.03599) |
| Animate124: Animating One Image to 4D Dynamic Scene | arXiv | 2023-11-24 | [Code](https://github.com/HeliosZhao/Animate124) / [Paper](https://arxiv.org/abs/2311.14603) |
| A Unified Approach for Text- and Image-guided 4D Scene Generation | arXiv | 2023-11-28 | [Code](https://github.com/NVlabs/dream-in-4d) / [Paper](https://arxiv.org/abs/2311.16854) |
| TextureDreamer: Image-guided Texture Synthesis through Geometry-aware Diffusion | arXiv | 2024-01-17 | — / [Paper](https://arxiv.org/abs/2401.09416) |
| TIP-Editor: An Accurate 3D Editor Following Both Text-Prompts And Image-Prompts | arXiv | 2024-01-26 | [Code](https://zjy526223908.github.io/TIP-Editor/) / [Paper](https://arxiv.org/abs/2401.14828) |


## Others

| Title | Venue | Date | Links |
|-------|-------|------|-------|
| Anti-DreamBooth: Protecting Users from Personalized Text-to-Image Synthesis | arXiv | 2023-03-27 | [Code](https://github.com/VinAIResearch/Anti-DreamBooth) / [Paper](https://arxiv.org/pdf/2303.15433) |
| Backdooring Textual Inversion for Concept Censorship | arXiv | 2023-08-21 | [Code](https://github.com/concept-censorship/concept-censorship.github.io/tree/main/code) / [Paper](https://arxiv.org/pdf/2308.10718) |
| Personalization as a Shortcut for Few-Shot Backdoor Attack against Text-to-Image Diffusion Models | AAAI | 2024-03-24 | — / [Paper](https://ojs.aaai.org/index.php/AAAI/article/view/30110) |
| ReVersion: Diffusion-Based Relation Inversion from Images | arXiv | 2023-03-23 | [Code](https://github.com/ziqihuangg/ReVersion) / [Paper](https://arxiv.org/pdf/2303.13495) |
| Learning Disentangled Identifiers for Action-Customized Text-to-Image Generation | arXiv | 2023-11-30 | [Code](https://adi-t2i.github.io/ADI/) / [Paper](https://arxiv.org/pdf/2311.15841) |
| Inv-ReVersion: Enhanced Relation Inversion Based on Text-to-Image Diffusion Models | MDPI | 2024-04-15 | — / [Paper](https://www.mdpi.com/2076-3417/14/8/3338) |
| Continual Diffusion: Continual Customization of Text-to-Image Diffusion with C-LoRA | arXiv | 2023-04-12 | [Code](https://jamessealesmith.github.io/continual-diffusion/) / [Paper](https://arxiv.org/pdf/2304.06027) |
| Text-Guided Vector Graphics Customization | SIGGRAPH 2023 | 2023-09-21 | [Code](https://intchous.github.io/SVGCustomization/) / [Paper](https://arxiv.org/pdf/2309.12302) |
| Customizing 360-Degree Panoramas Through Text-to-Image Diffusion Models | WACV 2024 | 2023-10-28 | [Code](https://github.com/littlewhitesea/StitchDiffusion) / [Paper](https://arxiv.org/pdf/2310.18840) |


# Contact Us

If you find any missing work, please report it by creating an [Issue](https://github.com/zhangxulu1996/awesome-personalization/issues/new) in the repository to contribute the community together.
