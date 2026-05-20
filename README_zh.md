<div align="center">
  <img src="assets/logo/lance-logo.webp" alt="Lance logo" width="300">

  <h1 align="center"><sup>Lance: Unified Multimodal Modeling by Multi-Task Synergy</sup></h1>
  <p>
    <strong>
    <a href="https://scholar.google.com.hk/citations?user=FXxoQlsAAAAJ&hl=zh-CN&oi=ao" style="text-decoration: none; color: inherit;">Fengyi Fu</a><sup>*</sup>, 
    <a href="https://corleone-huang.github.io/" style="text-decoration: none; color: inherit;">Mengqi Huang</a><sup>*,✉</sup>, 
    <a href="https://scholar.google.com.hk/citations?user=9ER6nVkAAAAJ&hl=zh-CN&oi=ao" style="text-decoration: none; color: inherit;">Shaojin Wu</a><sup>*</sup>, 
    Yunsheng Jiang<sup>*</sup>, 
    Yufei Huo, 
    <a href="https://guojianzhu.com/" style="text-decoration: none; color: inherit;">Jianzhu Guo</a><sup>✉,§</sup>
    </strong><br>
    Hao Li, 
    Yinghang Song, 
    Fei Ding, 
    Qian He, 
    Zheren Fu, 
    Zhendong Mao, 
    Yongdong Zhang
    <br>
    <em>ByteDance</em>
    <br>
    <sup>*</sup> 共同一作 &nbsp;&nbsp; <sup>✉</sup> 通讯作者 &nbsp;&nbsp; <sup>§</sup> Project lead
  </p>
  <p>
    <a href="https://lance-project.github.io/" style="text-decoration: none; margin: 0 8px;"><img src="https://img.shields.io/badge/Homepage-Lance-blue?style=flat" alt="Homepage"></a>
    <a href="http://arxiv.org/abs/2605.18678" style="text-decoration: none; margin: 0 8px;"><img src="https://img.shields.io/badge/Paper-arXiv-red?style=flat&logo=arxiv" alt="arXiv"></a>
    <a href="https://huggingface.co/bytedance-research/Lance" style="text-decoration: none; margin: 0 8px;"><img src="https://img.shields.io/badge/Model-HuggingFace-yellow?style=flat&logo=huggingface" alt="Model"></a>
    <br>
    <a href="./README.md"><ins>English</ins></a> | 简体中文
  </p>
</div>

## 🌟 亮点

**Lance** 是一个3B参数、原生统一的多模态模型，在单一框架下同时支持 **图像与视频的理解、生成和编辑**。

- **3B 规模高效强大。** 仅使用 **3B active parameters**，Lance 即可在图像生成、图像编辑和视频生成等基准上取得强劲表现。
- **从零训练。** Lance 采用分阶段多任务训练配方，在 **128 张 A100 GPU** 的预算内从零完成训练。

<div align="center">
  <img src="assets/benchmarks/benchmark-overview.png" alt="Lance benchmark overview across image generation, image editing, video generation, and video understanding" width="980">
</div>

## 🎨 演示

### 文生视频

<table align="center">
  <tr>
    <td><a href="assets/text-to-video/videos/text-to-video-demo-01.mp4"><img src="assets/text-to-video/previews/text-to-video-demo-01.gif" width="100%"></a></td>
    <td><a href="assets/text-to-video/videos/text-to-video-demo-02.mp4"><img src="assets/text-to-video/previews/text-to-video-demo-02.gif" width="100%"></a></td>
    <td><a href="assets/text-to-video/videos/text-to-video-demo-03.mp4"><img src="assets/text-to-video/previews/text-to-video-demo-03.gif" width="100%"></a></td>
    <td><a href="assets/text-to-video/videos/text-to-video-demo-04.mp4"><img src="assets/text-to-video/previews/text-to-video-demo-04.gif" width="100%"></a></td>
  </tr>
  <tr>
    <td><a href="assets/text-to-video/videos/text-to-video-demo-05.mp4"><img src="assets/text-to-video/previews/text-to-video-demo-05.gif" width="100%"></a></td>
    <td><a href="assets/text-to-video/videos/text-to-video-demo-06.mp4"><img src="assets/text-to-video/previews/text-to-video-demo-06.gif" width="100%"></a></td>
    <td><a href="assets/text-to-video/videos/text-to-video-demo-07.mp4"><img src="assets/text-to-video/previews/text-to-video-demo-07.gif" width="100%"></a></td>
    <td><a href="assets/text-to-video/videos/text-to-video-demo-08.mp4"><img src="assets/text-to-video/previews/text-to-video-demo-08.gif" width="100%"></a></td>
  </tr>
</table>

### 视频编辑

<table align="center">
  <tr>
    <td><a href="assets/video-editing/videos/video-editing-demo-01.mp4"><img src="assets/video-editing/previews/video-editing-demo-01.gif" width="100%"></a></td>
    <td><a href="assets/video-editing/videos/video-editing-demo-02.mp4"><img src="assets/video-editing/previews/video-editing-demo-02.gif" width="100%"></a></td>
    <td><a href="assets/video-editing/videos/video-editing-demo-03.mp4"><img src="assets/video-editing/previews/video-editing-demo-03.gif" width="100%"></a></td>
    <td><a href="assets/video-editing/videos/video-editing-demo-04.mp4"><img src="assets/video-editing/previews/video-editing-demo-04.gif" width="100%"></a></td>
  </tr>
  <tr>
    <td><a href="assets/video-editing/videos/video-editing-demo-05.mp4"><img src="assets/video-editing/previews/video-editing-demo-05.gif" width="100%"></a></td>
    <td><a href="assets/video-editing/videos/video-editing-demo-06.mp4"><img src="assets/video-editing/previews/video-editing-demo-06.gif" width="100%"></a></td>
    <td><a href="assets/video-editing/videos/video-editing-demo-07.mp4"><img src="assets/video-editing/previews/video-editing-demo-07.gif" width="100%"></a></td>
    <td><a href="assets/video-editing/videos/video-editing-demo-08.mp4"><img src="assets/video-editing/previews/video-editing-demo-08.gif" width="100%"></a></td>
  </tr>
</table>

### 多轮一致性编辑

<div align="center">
  <a href="assets/multi-turn-editing/videos/multi-turn-editing-demo-01.mp4">
    <img src="assets/multi-turn-editing/previews/multi-turn-editing-demo-01.gif" width="100%">
  </a>
</div>

### 智能视频生成

<table align="center">
  <tr>
    <td><a href="assets/intelligent-video/videos/intelligent-video-demo-01.mp4"><img src="assets/intelligent-video/previews/intelligent-video-demo-01.gif" width="100%"></a></td>
    <td><a href="assets/intelligent-video/videos/intelligent-video-demo-02.mp4"><img src="assets/intelligent-video/previews/intelligent-video-demo-02.gif" width="100%"></a></td>
    <td><a href="assets/intelligent-video/videos/intelligent-video-demo-03.mp4"><img src="assets/intelligent-video/previews/intelligent-video-demo-03.gif" width="100%"></a></td>
    <td><a href="assets/intelligent-video/videos/intelligent-video-demo-04.mp4"><img src="assets/intelligent-video/previews/intelligent-video-demo-04.gif" width="100%"></a></td>
  </tr>
</table>

### 视频理解

<div align="center">
  <table align="center">
    <tr>
      <td align="left" valign="top" width="33%">
        <a href="assets/video-understanding/videos/video-understanding-vqa-01.mp4">
          <img src="assets/video-understanding/previews/video-understanding-vqa-01.gif" width="100%">
        </a>
        <p><strong>问题：</strong> How many times did the person launch objects on the table? Options: (A) 3 (B) 2 (C) 4</p>
        <p><strong>Response:</strong> (A) 3</p>
      </td>
      <td align="left" valign="top" width="33%">
        <a href="assets/video-understanding/videos/video-understanding-vqa-02.mp4">
          <img src="assets/video-understanding/previews/video-understanding-vqa-02.gif" width="100%">
        </a>
        <p><strong>问题：</strong> The person makes sets of repeated actions. How many distinct repeated actions did the person do? Options: (A) 2 (B) 3 (C) 4</p>
        <p><strong>Response:</strong> (A) 2</p>
      </td>
      <td align="left" valign="top" width="33%">
        <a href="assets/video-understanding/videos/video-understanding-vqa-03.mp4">
          <img src="assets/video-understanding/previews/video-understanding-vqa-03.gif" width="100%">
        </a>
        <p><strong>问题：</strong> In which direction does the purple sphere move in the video? Options: (A) Down and to the right. (B) Up and to the left. (C) Up and to the right. (D) The object is stationary.</p>
        <p><strong>Response:</strong> (A) Down and to the right.</p>
      </td>
    </tr>
    <tr>
      <td align="left" valign="top" width="33%">
        <a href="assets/video-understanding/videos/video-understanding-vqa-04.mp4">
          <img src="assets/video-understanding/previews/video-understanding-vqa-04.gif" width="100%">
        </a>
        <p><strong>问题：</strong> What is the unrealistic phenomenon displayed in the video? Options: (A) The man can manipulate time via phone. (B) Man grabs an object through a phone screen. (C) Chocolate transforms into different objects. (D) Visible means of propulsion enables flight.</p>
        <p><strong>Response:</strong> (B) Man grabs an object through a phone screen.</p>
      </td>
      <td align="left" valign="top" width="33%">
        <a href="assets/video-understanding/videos/video-understanding-caption-short-01.mp4">
          <img src="assets/video-understanding/previews/video-understanding-caption-short-01.gif" width="100%">
        </a>
        <p><strong>问题：</strong> Offer a succinct account of the culinary process shown in this video.</p>
        <p><strong>Response:</strong> Add tomato puree and mix it well with chicken pieces.</p>
      </td>
      <td align="left" valign="top" width="33%">
        <a href="assets/video-understanding/videos/video-understanding-caption-long-01.mp4">
          <img src="assets/video-understanding/previews/video-understanding-caption-long-01.gif" width="100%">
        </a>
        <p><strong>问题：</strong> Provide a detailed description of the given video, capturing its key moments.</p>
        <p><strong>Response:</strong> In a sunlit meadow, a small tortoiseshell butterfly rests on a purple flower. A bee, with black and yellow stripes, lands on the same flower. The butterfly flaps its wings gently, while the bee busies itself, collecting nectar. The flower sways slightly in the breeze. The butterfly then takes off, and the bee follows, both heading to the next flower. The scene is a vivid display of insect interaction in a natural setting, with the colors of the butterfly and the bee contrasting against the green background of the meadow. The video captures this peaceful moment in a short 6-second duration.</p>
      </td>
    </tr>
  </table>
</div>

### 文生图

<div align="center">
  <img src="assets/text-to-image/text-to-image-overview.webp" alt="Lance text-to-image generation examples" width="100%">
</div>

### 图像编辑

<div align="center">
  <img src="assets/image-editing/image-editing-overview.webp" alt="Lance image editing examples" width="100%">
</div>

### 图像理解

<div align="center">
  <table align="center">
    <tr>
      <td align="left" valign="top" width="33%">
        <img src="assets/image-understanding/cases/image-understanding-case-01.png" alt="Pie chart reasoning case" width="100%">
        <p><strong>问题：</strong> Is the largest segment greater than sum of all the other segments?</p>
        <p><strong>Response:</strong> Yes, the largest segment in the pie chart is the blue one, which is the most populous segment.</p>
      </td>
      <td align="left" valign="top" width="33%">
        <img src="assets/image-understanding/cases/image-understanding-case-02.png" alt="Survey chart about border security priorities" width="100%">
        <p><strong>问题：</strong> What percentage of respondents want better border security?</p>
        <p><strong>Response:</strong> 29%</p>
      </td>
      <td align="left" valign="top" width="33%">
        <img src="assets/image-understanding/cases/image-understanding-case-03.png" alt="License plate recognition case" width="100%">
        <p><strong>问题：</strong> What is the license plate number of the car?</p>
        <p><strong>Response:</strong> The license plate number of the car is BX62 BFY.</p>
      </td>
    </tr>
    <tr>
      <td align="left" valign="top" width="33%">
        <img src="assets/image-understanding/cases/image-understanding-case-04.png" alt="Market research chart reasoning case" width="100%">
        <p><strong>问题：</strong> According to the data from the proprietary market research, how much amount was spent on the promotional meetings and events during 1998?</p>
        <p><strong>Response:</strong> According to the data from the proprietary market research, the total amount spent on the promotional meetings and events during 1998 was approximately $1.3 billion.</p>
      </td>
      <td align="left" valign="top" width="33%">
        <img src="assets/image-understanding/cases/image-understanding-case-05.png" alt="Colosseum description case" width="100%">
        <p><strong>问题：</strong> What is the appearance of the Colosseum in Rome, Italy?</p>
        <p><strong>Response:</strong> The Colosseum in Rome, Italy is a magnificent ancient amphitheater made of stone and concrete. It is characterized by its large, arched openings and its semi-circular shape. The Colosseum has been partially restored, and its original color has faded, but the architectural details, like the columns and the semi-circular arches, are still visible. The lighting in the image highlights the grandeur and historical significance of the Colosseum, making it stand out against the backdrop of the evening sky.</p>
      </td>
      <td align="left" valign="top" width="33%">
        <img src="assets/image-understanding/cases/image-understanding-case-06.png" alt="Total solar eclipse case" width="100%">
        <p><strong>问题：</strong> How does a total solar eclipse look like from Earth?</p>
        <p><strong>Response:</strong> A total solar eclipse looks like a dark circle with a bright, white outer edge. This is a result of the Earth's rotation and the Earth's shadow, which partially obscures the sun's light. The bright white edge of the eclipse is caused by the sun's high energy and its interaction with the Earth's atmosphere, while the dark part of the eclipse is due to the Earth's shadow and the surrounding air currents. The solar eclipse's shape, with its bright white edge and dark center, is similar to the shape of a full moon or a dark disk. It is a natural phenomenon that occurs in the atmosphere of the Earth and is an important part of the solar system.</p>
      </td>
    </tr>
  </table>
</div>

## 🚀 安装

### 推荐环境

- **操作系统：** Windows 10/11（64 位）
- **软件环境：** Python 3.11（由 `setup_env.bat` 自动固定），CUDA 12.8+（必需）
- **硬件环境：** 推理至少需要一张显存不低于 40GB 的 GPU

### 安装步骤
```cmd
setup_env.bat
```

该脚本会自动完成以下操作：
1. 下载 `uv.exe`（Python 包管理器）
2. 固定 Python 3.11 并创建 `.venv` 虚拟环境
3. 从 `requirements.txt` 安装所有依赖（自动过滤 Linux 专用包）
4. 安装 Windows 兼容的 `triton` 和 `flash-attn` wheel
5. 安装 `torch 2.7.0+cu128`、`transformers`、`diffusers`、`gradio`
6. 从 HuggingFace 下载模型权重（`Lance_3B_Video`、`Qwen2.5-VL-ViT`、`Wan2.2_VAE`）到 `downloads/`

可选参数：
```cmd
setup_env.bat --uv-tag 0.11.15    :: 指定 uv 版本
setup_env.bat --clear-venv        :: 删除 .venv 后重新创建
```

### 下载模型权重

如果在安装时跳过了自动下载，或者需要额外的模型变体，可使用以下脚本。

## 📥 Batch 脚本说明

本项目是 Lance 的 **Windows 原生移植版**。所有原始的 `.sh` 脚本已替换为 `.bat` 等效脚本：

| 脚本 | 用途 |
| --- | --- |
| `setup_env.bat` | **完整环境搭建。** 下载 `uv.exe`，创建 `.venv`，安装所有 Python 依赖（包括 Windows 兼容的 `triton` 和 `flash-attn`），并下载模型权重。这是第一个需要运行的脚本。 |
| `lance_download_models.bat` | **交互式模型下载器。** 启动 `lance_download_models.py`——通过交互式菜单选择要下载或更新的模型组件（`Lance_3B_Video`、`Lance_3B`、`Qwen2.5-VL-ViT`、`Wan2.2_VAE` 或组合包）。支持断点续传并显示下载进度。 |
| `download_lance_3b.bat` | **仅下载 `Lance_3B`（图像模型）。** 快速下载 `Lance_3B/` 权重到 `downloads/`。如果已存在则跳过。 |
| `inference_lance.bat` | **统一推理启动器。** 通过 `accelerate launch` 运行 `inference_lance.py`。支持全部六种任务（`t2i`、`t2v`、`image_edit`、`video_edit`、`x2t_image`、`x2t_video`）。参数可通过环境变量或命令行标志配置（见下方说明）。 |
| `run_gradio_image.bat` | **启动图像 Gradio 演示。** 运行 `lance_gradio_image.py`——提供 `t2i`（文生图）、`image_edit`（图像编辑）和 `x2t_image`（图像理解）的 Web 界面。启动时可选择普通模式或 `--fp8` 模式。 |
| `run_gradio_video.bat` | **启动视频 Gradio 演示。** 运行 `lance_gradio_video.py`——提供 `t2v`（文生视频）、`v2t`（视频理解）和 `video_edit`（视频编辑）的 Web 界面。启动时可选择普通模式或 `--fp8` 模式。 |

## 📚 使用方法

### 推理

Lance 为生成、编辑和理解任务提供了统一的命令行入口：

#### 方式一：配置并运行统一推理脚本

```cmd
inference_lance.bat
```

- 运行前，可以通过环境变量配置推理参数，或编辑 `inference_lance.bat` 顶部的默认值。
- **支持任务：** `t2i`、`t2v`、`image_edit`、`video_edit`、`x2t_image` 和 `x2t_video`。你也可以在 `inference_lance.py` 中修改 `TASK_DEFAULT_CONFIGS`，自定义每个任务默认使用的数据样例。
- **注意：** 对于所有任务，建议在编写输入 prompt 时参考提供示例中的 `prompt` 格式，这通常有助于获得更好的生成效果。

#### 方式二：通过命令行传递参数

我们提供了面向不同生成、编辑和理解任务的一键启动命令。

##### 文生视频

```cmd
inference_lance.bat --TASK_NAME t2v --MODEL_PATH downloads/Lance_3B_Video --RESOLUTION video_480p --NUM_FRAMES 121 --VIDEO_HEIGHT 480 --VIDEO_WIDTH 848 --SAVE_PATH_GEN results/t2v
```

##### 文生图

```cmd
inference_lance.bat --TASK_NAME t2i --MODEL_PATH downloads/Lance_3B --RESOLUTION image_768res --VIDEO_HEIGHT 768 --VIDEO_WIDTH 768 --SAVE_PATH_GEN results/t2i
```

##### 视频编辑

```cmd
inference_lance.bat --TASK_NAME video_edit --MODEL_PATH downloads/Lance_3B_Video --RESOLUTION video_480p --SAVE_PATH_GEN results/video_edit
```

##### 图像编辑

```cmd
inference_lance.bat --TASK_NAME image_edit --MODEL_PATH downloads/Lance_3B --RESOLUTION image_768res --SAVE_PATH_GEN results/image_edit
```

##### 视频理解

```cmd
inference_lance.bat --TASK_NAME x2t_video --MODEL_PATH downloads/Lance_3B_Video --RESOLUTION video_480p --NUM_FRAMES 50 --SAVE_PATH_GEN results/x2t_video
```

##### 图像理解

```cmd
inference_lance.bat --TASK_NAME x2t_image --MODEL_PATH downloads/Lance_3B --RESOLUTION image_768res --SAVE_PATH_GEN results/x2t_image
```

#### 可用任务

| 任务名 | 说明 | 示例 JSON |
|------------------------|--------------------------------------------------|----------------------------------------------|
| `t2v` | 文生视频 | `config/examples/t2v_example.json` |
| `t2i` | 文生图 | `config/examples/t2i_example.json` |
| `image_edit` | 图像编辑 | `config/examples/image_edit_example.json` |
| `video_edit` | 视频编辑 | `config/examples/video_edit_example.json` |
| `x2t_image` | 图像理解 | `config/examples/x2t_image_example.json` |
| `x2t_video` | 视频理解 | `config/examples/x2t_video_example.json` |

关于理解任务的示例文件：

- `config/examples/x2t_image_example.json`：用于图像理解示例，包括视觉问答和基于图像的推理。
- `config/examples/x2t_video_example.json`：用于视频理解示例，包括视频问答和视频描述。

#### 参数说明

你可以通过命令行标志或编辑 `inference_lance.bat` 顶部的默认值来配置以下超参数：

| 参数 | 默认值 | 说明 |
| --- | --- | --- |
| `MODEL_PATH` | `"downloads/Lance_3B_Video"` | 下载后的 Lance 模型权重路径（如 `Lance_3B` 或 `Lance_3B_Video`）。 |
| `NUM_GPUS` | `1` | 用于推理的 GPU 数量。 |
| `VALIDATION_NUM_TIMESTEPS` | `30` | 去噪步数（例如 30 或 50）。 |
| `VALIDATION_TIMESTEP_SHIFT` | `3.5` | Flow matching 调度中的 timestep shift 参数。 |
| `CFG_TEXT_SCALE` | `4.0` | 文本条件的 CFG（Classifier-Free Guidance）系数。 |
| `VALIDATION_DATA_SEED` | `42` | 用于复现实验的随机种子。 |
| `NUM_FRAMES` | `50` | 视频生成帧数（最大 121）。*图像任务不使用该参数。* |
| `VIDEO_HEIGHT` / `VIDEO_WIDTH`| `768` | 空间分辨率。*编辑任务不使用该参数（由输入图像/视频决定）。* |
| `RESOLUTION` | `"video_480p"` | 基础分辨率预设（如 `image_768res` 或 `video_480p`）。 |

### Gradio

#### 图像演示（t2i / image_edit / x2t_image）

```cmd
run_gradio_image.bat
```

或直接使用参数启动：
```cmd
.venv\Scripts\python.exe lance_gradio_image.py --gpus 0 --server-port 7861
.venv\Scripts\python.exe lance_gradio_image.py --gpus 0 --server-port 7861 --fp8
```

#### 视频演示（t2v / v2t / video_edit）

```cmd
run_gradio_video.bat
```

或直接使用参数启动：
```cmd
.venv\Scripts\python.exe lance_gradio_video.py --gpus 0 --server-port 7860
.venv\Scripts\python.exe lance_gradio_video.py --gpus 0 --server-port 7860 --fp8
```

两个 Gradio 脚本均支持多 GPU 推理（`--gpus 0,1,2,3`）和 `--fp8` 模式以降低显存占用（约节省 50%）。

### 基准评测

#### DPG-Bench 评测

<div align="center">
<table align="center">
  <thead>
    <tr>
      <th align="left">模型</th>
      <th align="center">#&nbsp;Params.</th>
      <th align="center">Global</th>
      <th align="center">Entity</th>
      <th align="center">Attribute</th>
      <th align="center">Relation</th>
      <th align="center">Other</th>
      <th align="center">Overall</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td align="center" colspan="8"><i>仅生成模型</i></td>
    </tr>
    <tr>
      <td align="left">SDXL</td><td align="center">3.5B</td><td align="center">83.27</td><td align="center">82.43</td><td align="center">80.91</td><td align="center">86.76</td><td align="center">80.41</td><td align="center">74.65</td>
    </tr>
    <tr>
      <td align="left">DALL-E 3</td><td align="center">-</td><td align="center">90.97</td><td align="center">89.61</td><td align="center">88.39</td><td align="center">90.58</td><td align="center">89.83</td><td align="center">83.50</td>
    </tr>
    <tr>
      <td align="left">SD3-Medium</td><td align="center">2B</td><td align="center">87.90</td><td align="center">91.01</td><td align="center">88.83</td><td align="center">80.70</td><td align="center">88.68</td><td align="center">84.08</td>
    </tr>
    <tr>
      <td align="left">FLUX.1-dev</td><td align="center">12B</td><td align="center">74.35</td><td align="center">90.00</td><td align="center">88.96</td><td align="center">90.87</td><td align="center">88.33</td><td align="center">83.84</td>
    </tr>
    <tr>
      <td align="left">Qwen-Image</td><td align="center">20B</td><td align="center">91.32</td><td align="center">91.56</td><td align="center">92.02</td><td align="center">94.31</td><td align="center">92.73</td><td align="center">88.32</td>
    </tr>
    <tr>
      <td align="center" colspan="8"><i>统一模型</i></td>
    </tr>
    <tr>
      <td align="left">Janus-Pro-7B</td><td align="center">7B</td><td align="center">86.90</td><td align="center">88.90</td><td align="center">89.40</td><td align="center">89.32</td><td align="center">89.48</td><td align="center">84.19</td>
    </tr>
    <tr>
      <td align="left">OmniGen2</td><td align="center">4B</td><td align="center">88.81</td><td align="center">88.83</td><td align="center">90.18</td><td align="center">89.37</td><td align="center">90.27</td><td align="center">83.57</td>
    </tr>
    <tr>
      <td align="left">Show-o2</td><td align="center">7B</td><td align="center">89.00</td><td align="center"><b>91.78</b></td><td align="center">89.96</td><td align="center">91.81</td><td align="center"><b>91.64</b></td><td align="center">86.14</td>
    </tr>
    <tr>
      <td align="left">BAGEL<sup>†</sup></td><td align="center">7B</td><td align="center">88.94</td><td align="center">90.37</td><td align="center"><u>91.29</u></td><td align="center">90.82</td><td align="center">88.67</td><td align="center">85.07</td>
    </tr>
    <tr>
      <td align="left">InternVL-U</td><td align="center">1.7B</td><td align="center"><u>90.39</u></td><td align="center">90.78</td><td align="center">90.68</td><td align="center">90.29</td><td align="center">88.77</td><td align="center">85.18</td>
    </tr>
    <tr>
      <td align="left">TUNA</td><td align="center">7B</td><td align="center"><b>90.42</b></td><td align="center"><u>91.68</u></td><td align="center">90.94</td><td align="center"><u>91.87</u></td><td align="center"><u>90.73</u></td><td align="center"><b>86.76</b></td>
    </tr>
    <tr>
      <td align="left">TUNA-2</td><td align="center">7B</td><td align="center">89.50</td><td align="center">91.40</td><td align="center"><b>92.07</b></td><td align="center">91.91</td><td align="center">88.81</td><td align="center"><u>86.54</u></td>
    </tr>
    <tr>
      <td align="left">🌟 <b>Lance (Ours)</b></td><td align="center"><b>3B</b></td><td align="center"><b>83.89</b></td><td align="center"><b>91.07</b></td><td align="center"><b>89.36</b></td><td align="center"><b>93.38</b></td><td align="center"><b>80.80</b></td><td align="center"><b>84.67</b></td>
    </tr>
  </tbody>
</table>
</div>

<p align="center"><em><sup>†</sup> 表示该方法在生成前使用 LLM rewriter 进行提示词改写。</em></p>

#### GenEval 评测

<div align="center">
<table align="center">
  <thead>
    <tr>
      <th align="left">模型</th>
      <th align="center">#&nbsp;Params.</th>
      <th align="center">1-Obj.</th>
      <th align="center">2-Obj.</th>
      <th align="center">Count</th>
      <th align="center">Colors</th>
      <th align="center">Position</th>
      <th align="center">Attr.</th>
      <th align="center">Overall</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td align="center" colspan="9"><i>仅生成模型</i></td>
    </tr>
    <tr>
      <td align="left">SDXL</td><td align="center">3.5B</td><td align="center">0.98</td><td align="center">0.74</td><td align="center">0.39</td><td align="center">0.85</td><td align="center">0.15</td><td align="center">0.23</td><td align="center">0.55</td>
    </tr>
    <tr>
      <td align="left">DALL-E 3</td><td align="center">-</td><td align="center">0.96</td><td align="center">0.87</td><td align="center">0.47</td><td align="center">0.83</td><td align="center">0.43</td><td align="center">0.45</td><td align="center">0.67</td>
    </tr>
    <tr>
      <td align="left">SD3-Medium</td><td align="center">2B</td><td align="center">0.99</td><td align="center">0.94</td><td align="center">0.72</td><td align="center">0.89</td><td align="center">0.33</td><td align="center">0.60</td><td align="center">0.74</td>
    </tr>
    <tr>
      <td align="left">FLUX.1-dev</td><td align="center">12B</td><td align="center">0.98</td><td align="center">0.93</td><td align="center">0.75</td><td align="center">0.93</td><td align="center">0.68</td><td align="center">0.65</td><td align="center">0.82</td>
    </tr>
    <tr>
      <td align="left">Qwen-Image</td><td align="center">20B</td><td align="center">0.99</td><td align="center">0.92</td><td align="center">0.89</td><td align="center">0.88</td><td align="center">0.76</td><td align="center">0.77</td><td align="center">0.87</td>
    </tr>
    <tr>
      <td align="center" colspan="9"><i>统一模型</i></td>
    </tr>
    <tr>
      <td align="left">Janus-Pro-7B</td><td align="center">7B</td><td align="center"><u>0.99</u></td><td align="center">0.89</td><td align="center">0.59</td><td align="center">0.90</td><td align="center">0.79</td><td align="center">0.66</td><td align="center">0.80</td>
    </tr>
    <tr>
      <td align="left">OmniGen2</td><td align="center">4B</td><td align="center"><b>1.00</b></td><td align="center">0.95</td><td align="center">0.64</td><td align="center">0.88</td><td align="center">0.55</td><td align="center">0.76</td><td align="center">0.80</td>
    </tr>
    <tr>
      <td align="left">Show-o2</td><td align="center">7B</td><td align="center"><b>1.00</b></td><td align="center">0.87</td><td align="center">0.58</td><td align="center">0.92</td><td align="center">0.52</td><td align="center">0.62</td><td align="center">0.76</td>
    </tr>
    <tr>
      <td align="left">BAGEL<sup>†</sup></td><td align="center">7B</td><td align="center">0.98</td><td align="center">0.95</td><td align="center"><b>0.84</b></td><td align="center"><u>0.95</u></td><td align="center">0.78</td><td align="center">0.77</td><td align="center">0.88</td>
    </tr>
    <tr>
      <td align="left">Mogao</td><td align="center">7B</td><td align="center"><b>1.00</b></td><td align="center"><b>0.97</b></td><td align="center"><u>0.83</u></td><td align="center">0.93</td><td align="center">0.84</td><td align="center">0.80</td><td align="center"><u>0.89</u></td>
    </tr>
    <tr>
      <td align="left">InternVL-U</td><td align="center">1.7B</td><td align="center"><u>0.99</u></td><td align="center">0.94</td><td align="center">0.74</td><td align="center">0.91</td><td align="center">0.77</td><td align="center">0.74</td><td align="center">0.85</td>
    </tr>
    <tr>
      <td align="left">TUNA</td><td align="center">7B</td><td align="center"><b>1.00</b></td><td align="center"><b>0.97</b></td><td align="center">0.81</td><td align="center">0.91</td><td align="center"><b>0.88</b></td><td align="center"><b>0.83</b></td><td align="center"><b>0.90</b></td>
    </tr>
    <tr>
      <td align="left">TUNA-2</td><td align="center">7B</td><td align="center"><u>0.99</u></td><td align="center"><u>0.96</u></td><td align="center">0.80</td><td align="center">0.91</td><td align="center">0.84</td><td align="center">0.76</td><td align="center">0.87</td>
    </tr>
    <tr>
      <td align="left">🌟 <b>Lance (Ours)</b></td><td align="center"><b>3B</b></td><td align="center"><b>1.00</b></td><td align="center"><b>0.94</b></td><td align="center"><b>0.84</b></td><td align="center"><b>0.97</b></td><td align="center"><b>0.87</b></td><td align="center"><b>0.81</b></td><td align="center"><b>0.90</b></td>
    </tr>
  </tbody>
</table>
</div>

<p align="center"><em><sup>†</sup> 表示该方法在生成前使用 LLM rewriter 进行提示词改写。</em></p>

#### GEdit-Bench 评测

<div align="center">
<table align="center">
  <thead>
    <tr>
      <th align="left">模型</th>
      <th align="center">#&nbsp;Params.</th>
      <th align="center">BC</th>
      <th align="center">CA</th>
      <th align="center">MM</th>
      <th align="center">MC</th>
      <th align="center">PB</th>
      <th align="center">ST</th>
      <th align="center">SA</th>
      <th align="center">SR</th>
      <th align="center">SRp</th>
      <th align="center">TM</th>
      <th align="center">TT</th>
      <th align="center">Avg/G_O</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td align="center" colspan="14"><i>仅生成模型</i></td>
    </tr>
    <tr>
      <td align="left">Gemini 2.0</td><td align="center">-</td><td align="center">-</td><td align="center">-</td><td align="center">-</td><td align="center">-</td><td align="center">-</td><td align="center">-</td><td align="center">-</td><td align="center">-</td><td align="center">-</td><td align="center">-</td><td align="center">-</td><td align="center">6.32</td>
    </tr>
    <tr>
      <td align="left">GPT Image 1</td><td align="center">-</td><td align="center">6.96</td><td align="center">6.85</td><td align="center">7.10</td><td align="center">5.41</td><td align="center">6.74</td><td align="center">7.44</td><td align="center">7.51</td><td align="center">8.73</td><td align="center">8.55</td><td align="center">8.45</td><td align="center">8.69</td><td align="center">7.49</td>
    </tr>
    <tr>
      <td align="left">Qwen-Image-Edit</td><td align="center">20B</td><td align="center">8.23</td><td align="center">8.30</td><td align="center">7.33</td><td align="center">8.05</td><td align="center">7.49</td><td align="center">6.74</td><td align="center">8.57</td><td align="center">8.09</td><td align="center">8.29</td><td align="center">8.48</td><td align="center">8.50</td><td align="center">8.01</td>
    </tr>
    <tr>
      <td align="center" colspan="14"><i>统一模型</i></td>
    </tr>
    <tr>
      <td align="left">Lumina-DiMOO</td><td align="center">8B</td><td align="center">3.43</td><td align="center">4.27</td><td align="center">3.08</td><td align="center">2.77</td><td align="center">4.74</td><td align="center">5.19</td><td align="center">4.44</td><td align="center">3.80</td><td align="center">4.38</td><td align="center">2.68</td><td align="center">4.20</td><td align="center">3.91</td>
    </tr>
    <tr>
      <td align="left">Ovis-U1</td><td align="center">1.2B</td><td align="center"><u>7.49</u></td><td align="center">6.88</td><td align="center">6.21</td><td align="center">4.79</td><td align="center">5.98</td><td align="center"><u>6.46</u></td><td align="center">7.49</td><td align="center"><u>7.25</u></td><td align="center"><u>7.27</u></td><td align="center">4.48</td><td align="center">6.31</td><td align="center">6.42</td>
    </tr>
    <tr>
      <td align="left">BAGEL</td><td align="center">7B</td><td align="center">7.32</td><td align="center">6.91</td><td align="center">6.38</td><td align="center">4.75</td><td align="center">4.57</td><td align="center">6.15</td><td align="center"><b>7.90</b></td><td align="center">7.16</td><td align="center">7.02</td><td align="center"><u>7.32</u></td><td align="center">6.22</td><td align="center">6.52</td>
    </tr>
    <tr>
      <td align="left">InternVL-U</td><td align="center">1.7B</td><td align="center">7.08</td><td align="center">7.05</td><td align="center">6.38</td><td align="center"><u>7.02</u></td><td align="center"><u>6.03</u></td><td align="center">6.27</td><td align="center">7.13</td><td align="center">6.55</td><td align="center">6.33</td><td align="center">6.59</td><td align="center"><u>6.85</u></td><td align="center">6.66</td>
    </tr>
    <tr>
      <td align="left">InternVL-U (w/ CoT)</td><td align="center">1.7B</td><td align="center">7.05</td><td align="center"><b>7.87</b></td><td align="center"><u>6.50</u></td><td align="center">6.99</td><td align="center">5.77</td><td align="center">6.10</td><td align="center">7.33</td><td align="center">7.16</td><td align="center">7.12</td><td align="center"><b>7.36</b></td><td align="center">6.46</td><td align="center"><u>6.88</u></td>
    </tr>
    <tr>
      <td align="left">🌟 <b>Lance (Ours)</b></td><td align="center"><b>3B</b></td><td align="center"><b>7.73</b></td><td align="center"><u>7.74</u></td><td align="center"><b>7.28</b></td><td align="center"><b>7.83</b></td><td align="center"><b>7.50</b></td><td align="center"><b>7.03</b></td><td align="center"><u>7.64</u></td><td align="center"><b>7.85</b></td><td align="center"><b>7.71</b></td><td align="center">4.46</td><td align="center"><b>7.57</b></td><td align="center"><b>7.30</b></td>
    </tr>
  </tbody>
</table>
</div>

#### VBench 评测（视频生成）

<div align="center">
<table align="center">
  <thead>
    <tr>
      <th align="left">类型</th>
      <th align="left">Model</th>
      <th align="center">#&nbsp;Params.</th>
      <th align="center">Total Score ↑</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td align="center" rowspan="12"><i>Gen. Only</i></td>
      <td align="left">ModelScope</td><td align="center">1.7B</td><td align="center">75.75</td>
    </tr>
    <tr>
      <td align="left">LaVie</td><td align="center">3B</td><td align="center">77.08</td>
    </tr>
    <tr>
      <td align="left">Show-1</td><td align="center">6B</td><td align="center">78.93</td>
    </tr>
    <tr>
      <td align="left">AnimateDiff-V2</td><td align="center">-</td><td align="center">80.27</td>
    </tr>
    <tr>
      <td align="left">VideoCrafter-2.0</td><td align="center">-</td><td align="center">80.44</td>
    </tr>
    <tr>
      <td align="left">CogVideoX</td><td align="center">5B</td><td align="center">81.61</td>
    </tr>
    <tr>
      <td align="left">Kling</td><td align="center">-</td><td align="center">81.85</td>
    </tr>
    <tr>
      <td align="left">Open-Sora-2.0</td><td align="center">-</td><td align="center">81.71</td>
    </tr>
    <tr>
      <td align="left">Gen-3</td><td align="center">-</td><td align="center">82.32</td>
    </tr>
    <tr>
      <td align="left">Step-Video-T2V</td><td align="center">30B</td><td align="center">81.83</td>
    </tr>
    <tr>
      <td align="left">Hunyuan Video</td><td align="center">-</td><td align="center">83.43</td>
    </tr>
    <tr>
      <td align="left">Wan2.1-T2V</td><td align="center">14B</td><td align="center">83.69</td>
    </tr>
    <tr>
      <td align="center" rowspan="6"><i>Unified</i></td>
      <td align="left">HaproOmni</td><td align="center">7B</td><td align="center">78.10</td>
    </tr>
    <tr>
      <td align="left">Emu3</td><td align="center">8B</td><td align="center">80.96</td>
    </tr>
    <tr>
      <td align="left">VILA-U</td><td align="center">7B</td><td align="center">74.01</td>
    </tr>
    <tr>
      <td align="left">Show-o2</td><td align="center">2B</td><td align="center">81.34</td>
    </tr>
    <tr>
      <td align="left">TUNA</td><td align="center">1.5B</td><td align="center"><u>84.06</u></td>
    </tr>
    <tr>
      <td align="left">🌟 <b>Lance (Ours)</b></td><td align="center"><b>3B</b></td><td align="center"><b>85.11</b></td>
    </tr>
  </tbody>
</table>
</div>

#### 运行基准评测

`benchmarks/` 目录下提供了可直接运行的基准评测脚本：

| 基准 | 模态 | 脚本 |
|------------------------|----------|---------------------------------------------------------------|
| GenEVAL（图像生成） | 图像 | `benchmarks/image_gen/GenEVAL/sample_GenEVAL.sh` |
| DPG（图像生成） | 图像 | `benchmarks/image_gen/DPG/sample_DPG.sh` |
| GEdit（图像编辑） | 图像 | `benchmarks/image_gen/GEdit/sample_GEdit.sh` |
| VBench（视频生成） | 视频 | `benchmarks/video_gen/Vbench/sample_vbench.sh` |


## 📄 许可证

Copyright 2025 Bytedance Ltd. and/or its affiliates.

## 🙏 致谢

我们感谢 [BAGEL](https://github.com/ByteDance-Seed/bagel)、[Qwen2.5-VL-3B-Instruct](https://huggingface.co/Qwen/Qwen2.5-VL-3B-Instruct) 和 [Wan2.2](https://github.com/Wan-Video/Wan2.2) 的贡献者，感谢他们开放的研究与社区贡献。

## 💖 引用

如果 **Lance** 对您的项目或研究有帮助，欢迎 🌟 本仓库，并使用以下 BibTeX 引用我们的工作：

```bibtex
@misc{fu2026lanceunifiedmultimodalmodeling,
      title         = {Lance: Unified Multimodal Modeling by Multi-Task Synergy},
      author        = {Fengyi Fu and Mengqi Huang and Shaojin Wu and Yunsheng Jiang and Yufei Huo and Hao Li and Yinghang Song and Fei Ding and Jianzhu Guo and Qian He and Zheren Fu and Zhendong Mao and Yongdong Zhang},
      year          = {2026},
      eprint        = {2605.18678},
      archivePrefix = {arXiv},
      primaryClass  = {cs.CV},
      url           = {https://arxiv.org/abs/2605.18678},
}
```

## 📞 联系方式

如有问题、反馈或合作需求，请联系 [Mengqi Huang](https://corleone-huang.github.io/) 和 [Jianzhu Guo](https://guojianzhu.com/)。
