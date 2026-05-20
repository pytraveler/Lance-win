<div align="center">
  <img src="assets/logo/lance-logo.webp" alt="Логотип Lance" width="300">

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
    <sup>*</sup> Равный вклад &nbsp;&nbsp; <sup>✉</sup> Ответственные авторы &nbsp;&nbsp; <sup>§</sup> Руководитель проекта
  </p>
  <p>
    <a href="https://lance-project.github.io/" style="text-decoration: none; margin: 0 8px;"><img src="https://img.shields.io/badge/Homepage-Lance-blue?style=flat" alt="Homepage"></a>
    <a href="http://arxiv.org/abs/2605.18678" style="text-decoration: none; margin: 0 8px;"><img src="https://img.shields.io/badge/Paper-arXiv-red?style=flat&logo=arxiv" alt="arXiv"></a>
    <a href="https://huggingface.co/bytedance-research/Lance" style="text-decoration: none; margin: 0 8px;"><img src="https://img.shields.io/badge/Model-HuggingFace-yellow?style=flat&logo=huggingface" alt="Model"></a>
    <br>
    <a href="./README.md"><ins>English</ins></a> | <a href="./README_zh.md"><ins>简体中文</ins></a> | Русский
  </p>
</div>

## 🌟 Ключевые особенности

**Lance** — нативная унифицированная мультимодальная модель на 3 млрд параметров, поддерживающая **понимание, генерацию и редактирование изображений и видео** в едином фреймворке.

- **Эффективность при масштабе 3B.** Имея лишь **3B активных параметров**, Lance демонстрирует высокие результаты в бенчмарках генерации изображений, редактирования изображений и генерации видео.
- **Обучена с нуля.** Lance построена поэтапной мультимодальной стратегией и полностью обучена с нуля (за исключением энкодеров ViT и VAE; трансформерная основа обучена с нуля) на бюджете из **128 GPU A100**.

<div align="center">
  <img src="assets/benchmarks/benchmark-overview.png" alt="Обзор бенчмарков Lance: генерация изображений, редактирование изображений, генерация видео, понимание видео" width="980">
</div>

## 🎨 Демонстрация

### Текст-Видео

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

### Редактирование видео

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

### Многораундовое редактирование с сохранением согласованности

<div align="center">
  <a href="assets/multi-turn-editing/videos/multi-turn-editing-demo-01.mp4">
    <img src="assets/multi-turn-editing/previews/multi-turn-editing-demo-01.gif" width="100%">
  </a>
</div>

### Интеллектуальная генерация видео

<table align="center">
  <tr>
    <td><a href="assets/intelligent-video/videos/intelligent-video-demo-01.mp4"><img src="assets/intelligent-video/previews/intelligent-video-demo-01.gif" width="100%"></a></td>
    <td><a href="assets/intelligent-video/videos/intelligent-video-demo-02.mp4"><img src="assets/intelligent-video/previews/intelligent-video-demo-02.gif" width="100%"></a></td>
    <td><a href="assets/intelligent-video/videos/intelligent-video-demo-03.mp4"><img src="assets/intelligent-video/previews/intelligent-video-demo-03.gif" width="100%"></a></td>
    <td><a href="assets/intelligent-video/videos/intelligent-video-demo-04.mp4"><img src="assets/intelligent-video/previews/intelligent-video-demo-04.gif" width="100%"></a></td>
  </tr>
</table>

### Понимание видео

<div align="center">
  <table align="center">
    <tr>
      <td align="left" valign="top" width="33%">
        <a href="assets/video-understanding/videos/video-understanding-vqa-01.mp4">
          <img src="assets/video-understanding/previews/video-understanding-vqa-01.gif" width="100%">
        </a>
        <p><strong>Вопрос:</strong> How many times did the person launch objects on the table? Options: (A) 3 (B) 2 (C) 4</p>
        <p><strong>Ответ:</strong> (A) 3</p>
      </td>
      <td align="left" valign="top" width="33%">
        <a href="assets/video-understanding/videos/video-understanding-vqa-02.mp4">
          <img src="assets/video-understanding/previews/video-understanding-vqa-02.gif" width="100%">
        </a>
        <p><strong>Вопрос:</strong> The person makes sets of repeated actions. How many distinct repeated actions did the person do? Options: (A) 2 (B) 3 (C) 4</p>
        <p><strong>Ответ:</strong> (A) 2</p>
      </td>
      <td align="left" valign="top" width="33%">
        <a href="assets/video-understanding/videos/video-understanding-vqa-03.mp4">
          <img src="assets/video-understanding/previews/video-understanding-vqa-03.gif" width="100%">
        </a>
        <p><strong>Вопрос:</strong> In which direction does the purple sphere move in the video? Options: (A) Down and to the right. (B) Up and to the left. (C) Up and to the right. (D) The object is stationary.</p>
        <p><strong>Ответ:</strong> (A) Down and to the right.</p>
      </td>
    </tr>
    <tr>
      <td align="left" valign="top" width="33%">
        <a href="assets/video-understanding/videos/video-understanding-vqa-04.mp4">
          <img src="assets/video-understanding/previews/video-understanding-vqa-04.gif" width="100%">
        </a>
        <p><strong>Вопрос:</strong> What is the unrealistic phenomenon displayed in the video? Options: (A) The man can manipulate time via phone. (B) Man grabs an object through a phone screen. (C) Chocolate transforms into different objects. (D) Visible means of propulsion enables flight.</p>
        <p><strong>Ответ:</strong> (B) Man grabs an object through a phone screen.</p>
      </td>
      <td align="left" valign="top" width="33%">
        <a href="assets/video-understanding/videos/video-understanding-caption-short-01.mp4">
          <img src="assets/video-understanding/previews/video-understanding-caption-short-01.gif" width="100%">
        </a>
        <p><strong>Вопрос:</strong> Offer a succinct account of the culinary process shown in this video.</p>
        <p><strong>Ответ:</strong> Add tomato puree and mix it well with chicken pieces.</p>
      </td>
      <td align="left" valign="top" width="33%">
        <a href="assets/video-understanding/videos/video-understanding-caption-long-01.mp4">
          <img src="assets/video-understanding/previews/video-understanding-caption-long-01.gif" width="100%">
        </a>
        <p><strong>Вопрос:</strong> Provide a detailed description of the given video, capturing its key moments.</p>
        <p><strong>Ответ:</strong> In a sunlit meadow, a small tortoiseshell butterfly rests on a purple flower. A bee, with black and yellow stripes, lands on the same flower. The butterfly flaps its wings gently, while the bee busies itself, collecting nectar. The flower sways slightly in the breeze. The butterfly then takes off, and the bee follows, both heading to the next flower. The scene is a vivid display of insect interaction in a natural setting, with the colors of the butterfly and the bee contrasting against the green background of the meadow. The video captures this peaceful moment in a short 6-second duration.</p>
      </td>
    </tr>
  </table>
</div>

### Генерация текст-изображение

<div align="center">
  <img src="assets/text-to-image/text-to-image-overview.webp" alt="Примеры генерации текст-изображение Lance" width="100%">
</div>

### Редактирование изображений

<div align="center">
  <img src="assets/image-editing/image-editing-overview.webp" alt="Примеры редактирования изображений Lance" width="100%">
</div>

### Понимание изображений

<div align="center">
  <table align="center">
    <tr>
      <td align="left" valign="top" width="33%">
        <img src="assets/image-understanding/cases/image-understanding-case-01.png" alt="Задача на рассуждение с круговой диаграммой" width="100%">
        <p><strong>Вопрос:</strong> Is the largest segment greater than sum of all the other segments?</p>
        <p><strong>Ответ:</strong> Yes, the largest segment in the pie chart is the blue one, which is the most populous segment.</p>
      </td>
      <td align="left" valign="top" width="33%">
        <img src="assets/image-understanding/cases/image-understanding-case-02.png" alt="Диаграмма опроса о приоритетах пограничной безопасности" width="100%">
        <p><strong>Вопрос:</strong> What percentage of respondents want better border security?</p>
        <p><strong>Ответ:</strong> 29%</p>
      </td>
      <td align="left" valign="top" width="33%">
        <img src="assets/image-understanding/cases/image-understanding-case-03.png" alt="Распознавание номерного знака" width="100%">
        <p><strong>Вопрос:</strong> What is the license plate number of the car?</p>
        <p><strong>Ответ:</strong> The license plate number of the car is BX62 BFY.</p>
      </td>
    </tr>
    <tr>
      <td align="left" valign="top" width="33%">
        <img src="assets/image-understanding/cases/image-understanding-case-04.png" alt="Задача на анализ рыночного исследования" width="100%">
        <p><strong>Вопрос:</strong> According to the data from the proprietary market research, how much amount was spent on the promotional meetings and events during 1998?</p>
        <p><strong>Ответ:</strong> According to the data from the proprietary market research, the total amount spent on the promotional meetings and events during 1998 was approximately $1.3 billion.</p>
      </td>
      <td align="left" valign="top" width="33%">
        <img src="assets/image-understanding/cases/image-understanding-case-05.png" alt="Описание Колизея" width="100%">
        <p><strong>Вопрос:</strong> What is the appearance of the Colosseum in Rome, Italy?</p>
        <p><strong>Ответ:</strong> The Colosseum in Rome, Italy is a magnificent ancient amphitheater made of stone and concrete. It is characterized by its large, arched openings and its semi-circular shape. The Colosseum has been partially restored, and its original color has faded, but the architectural details, like the columns and the semi-circular arches, are still visible. The lighting in the image highlights the grandeur and historical significance of the Colosseum, making it stand out against the backdrop of the evening sky.</p>
      </td>
      <td align="left" valign="top" width="33%">
        <img src="assets/image-understanding/cases/image-understanding-case-06.png" alt="Полное солнечное затмение" width="100%">
        <p><strong>Вопрос:</strong> How does a total solar eclipse look like from Earth?</p>
        <p><strong>Ответ:</strong> A total solar eclipse looks like a dark circle with a bright, white outer edge. This is a result of the Earth's rotation and the Earth's shadow, which partially obscures the sun's light. The bright white edge of the eclipse is caused by the sun's high energy and its interaction with the Earth's atmosphere, while the dark part of the eclipse is due to the Earth's shadow and the surrounding air currents. The solar eclipse's shape, with its bright white edge and dark center, is similar to the shape of a full moon or a dark disk. It is a natural phenomenon that occurs in the atmosphere of the Earth and is an important part of the solar system.</p>
      </td>
    </tr>
  </table>
</div>

## 🚀 Установка

### Рекомендуемое окружение

- **ОС:** Windows 10/11 (64-bit)
- **Программное обеспечение:** Python 3.11 (фиксируется автоматически скриптом `setup_env.bat`), CUDA 12.8+ (обязательно)
- **Оборудование:** GPU с объёмом видеопамяти не менее 40 ГБ для вывода

### Шаги установки
```cmd
setup_env.bat
```

Этот скрипт выполнит:
1. Загрузку `uv.exe` (менеджер пакетов Python)
2. Фиксацию Python 3.11 и создание виртуального окружения `.venv`
3. Установку всех зависимостей из `requirements.txt` (с фильтрацией Linux-пакетов)
4. Установку Windows-совместимых wheel-файлов для `triton` и `flash-attn`
5. Установку `torch 2.7.0+cu128`, `transformers`, `diffusers`, `gradio`
6. Загрузку весов моделей (`Lance_3B_Video`, `Qwen2.5-VL-ViT`, `Wan2.2_VAE`) с HuggingFace в `downloads/`

Дополнительные флаги:
```cmd
setup_env.bat --uv-tag 0.11.15    :: указать версию uv
setup_env.bat --clear-venv        :: удалить .venv перед пересозданием
```

### Загрузка весов моделей

Если вы пропустили автоматическую загрузку при установке или вам нужны дополнительные варианты моделей, используйте скрипты ниже.

## 📥 Описание Batch-скриптов

Это **Windows-порт** Lance. Все оригинальные shell-скрипты (`.sh`) заменены на `.bat`-аналоги:

| Скрипт | Назначение |
| --- | --- |
| `setup_env.bat` | **Полная настройка окружения.** Загружает `uv.exe`, создаёт `.venv`, устанавливает все Python-зависимости (включая Windows-совместимые wheel для `triton` и `flash-attn`) и загружает веса моделей. Это первый скрипт, который нужно запустить. |
| `lance_download_models.bat` | **Интерактивный загрузчик моделей.** Запускает `lance_download_models.py` — интерактивное меню для выбора компонентов модели для загрузки или обновления (`Lance_3B_Video`, `Lance_3B`, `Qwen2.5-VL-ViT`, `Wan2.2_VAE` или комбинированные наборы). Поддерживает докачку и отображает прогресс загрузки. |
| `download_lance_3b.bat` | **Загрузка только `Lance_3B` (модель для изображений).** Быстрый скрипт для загрузки весов `Lance_3B/` с HuggingFace в `downloads/`. Пропускается, если файлы уже присутствуют. |
| `inference_lance.bat` | **Единый запуск вывода.** Запускает `inference_lance.py` через `accelerate launch`. Поддерживает все шесть задач (`t2i`, `t2v`, `image_edit`, `video_edit`, `x2t_image`, `x2t_video`). Параметры настраиваются через переменные окружения или флаги командной строки (см. ниже). |
| `run_gradio_image.bat` | **Запуск Gradio-демо для изображений.** Запускает `lance_gradio_image.py` — веб-интерфейс для задач `t2i` (генерация текст-изображение), `image_edit` (редактирование изображений) и `x2t_image` (понимание изображений). При запуске предлагает выбрать обычный режим или режим `--fp8`. |
| `run_gradio_video.bat` | **Запуск Gradio-демо для видео.** Запускает `lance_gradio_video.py` — веб-интерфейс для задач `t2v` (генерация текст-видео), `v2t` (понимание видео) и `video_edit` (редактирование видео). При запуске предлагает выбрать обычный режим или режим `--fp8`. |

## 📚 Использование


### Вывод (Inference)

Мы предоставляем единый интерфейс командной строки для всех задач генерации, редактирования и понимания:

#### Способ 1: Настроить и запустить единый скрипт

```cmd
inference_lance.bat
```

- Перед запуском вы можете настроить параметры вывода через переменные окружения или отредактировать значения по умолчанию в начале файла `inference_lance.bat`.
- **Поддерживаемые задачи:** `t2i`, `t2v`, `image_edit`, `video_edit`, `x2t_image` и `x2t_video`. Вы можете изменить `TASK_DEFAULT_CONFIGS` в `inference_lance.py`, чтобы настроить образцы данных по умолчанию для каждой задачи.
- **Примечание:** Для всех задач рекомендуется следовать формату `prompt` из предоставленных примеров — это, как правило, улучшает качество генерации.

#### Способ 2: Передача параметров через командную строку

Мы предоставляем готовые команды для быстрого запуска различных задач генерации, редактирования и понимания.

##### Генерация текст-видео

```cmd
inference_lance.bat --TASK_NAME t2v --MODEL_PATH downloads/Lance_3B_Video --RESOLUTION video_480p --NUM_FRAMES 121 --VIDEO_HEIGHT 480 --VIDEO_WIDTH 848 --SAVE_PATH_GEN results/t2v
```

##### Генерация текст-изображение

```cmd
inference_lance.bat --TASK_NAME t2i --MODEL_PATH downloads/Lance_3B --RESOLUTION image_768res --VIDEO_HEIGHT 768 --VIDEO_WIDTH 768 --SAVE_PATH_GEN results/t2i
```

##### Редактирование видео

```cmd
inference_lance.bat --TASK_NAME video_edit --MODEL_PATH downloads/Lance_3B_Video --RESOLUTION video_480p --SAVE_PATH_GEN results/video_edit
```

##### Редактирование изображений

```cmd
inference_lance.bat --TASK_NAME image_edit --MODEL_PATH downloads/Lance_3B --RESOLUTION image_768res --SAVE_PATH_GEN results/image_edit
```

##### Понимание видео

```cmd
inference_lance.bat --TASK_NAME x2t_video --MODEL_PATH downloads/Lance_3B_Video --RESOLUTION video_480p --NUM_FRAMES 50 --SAVE_PATH_GEN results/x2t_video
```

##### Понимание изображений

```cmd
inference_lance.bat --TASK_NAME x2t_image --MODEL_PATH downloads/Lance_3B --RESOLUTION image_768res --SAVE_PATH_GEN results/x2t_image
```

#### Доступные задачи

| Имя задачи             | Описание                                         | Пример JSON                                  |
|------------------------|--------------------------------------------------|----------------------------------------------|
| `t2v`                  | Генерация текст-видео                            | `config/examples/t2v_example.json`           |
| `t2i`                  | Генерация текст-изображение                      | `config/examples/t2i_example.json`           |
| `image_edit`           | Редактирование изображений                       | `config/examples/image_edit_example.json`    |
| `video_edit`           | Редактирование видео                             | `config/examples/video_edit_example.json`    |
| `x2t_image`            | Понимание изображений                            | `config/examples/x2t_image_example.json`    |
| `x2t_video`            | Понимание видео                                  | `config/examples/x2t_video_example.json`    |

Примеры для задач понимания:

- `config/examples/x2t_image_example.json`: примеры понимания изображений — визуальный вопрос-ответ и рассуждения на основе изображений.
- `config/examples/x2t_video_example.json`: примеры понимания видео — вопрос-ответ по видео и создание описаний видео.

#### Параметры

Вы можете настроить следующие гиперпараметры через флаги командной строки или отредактировав значения по умолчанию в начале файла `inference_lance.bat`:

| Параметр | Значение по умолчанию | Описание |
| --- | --- | --- |
| `MODEL_PATH` | `"downloads/Lance_3B_Video"` | Путь к загруженным весам модели Lance (`Lance_3B` или `Lance_3B_Video`). |
| `NUM_GPUS` | `1` | Количество GPU для вывода. |
| `VALIDATION_NUM_TIMESTEPS` | `30` | Количество шагов денойзинга (например, 30 или 50). |
| `VALIDATION_TIMESTEP_SHIFT` | `3.5` | Параметр сдвига временных шагов для планирования flow matching. |
| `CFG_TEXT_SCALE` | `4.0` | Масштаб CFG (Classifier-Free Guidance) для текстового условия. |
| `VALIDATION_DATA_SEED` | `42` | Случайное зерно для воспроизводимости генерации. |
| `NUM_FRAMES` | `50` | Количество кадров для генерации видео (макс. 121). *Не используется для задач с изображениями.* |
| `VIDEO_HEIGHT` / `VIDEO_WIDTH`| `768` | Пространственное разрешение. *Не используется для задач редактирования (определяется входным изображением/видео).* |
| `RESOLUTION` | `"video_480p"` | Пресет базового разрешения (`image_768res` или `video_480p`). |

### Gradio

#### Демо для изображений (t2i / image_edit / x2t_image)

```cmd
run_gradio_image.bat
```

Или напрямую с параметрами:
```cmd
.venv\Scripts\python.exe lance_gradio_image.py --gpus 0 --server-port 7861
.venv\Scripts\python.exe lance_gradio_image.py --gpus 0 --server-port 7861 --fp8
```

#### Демо для видео (t2v / v2t / video_edit)

```cmd
run_gradio_video.bat
```

Или напрямую с параметрами:
```cmd
.venv\Scripts\python.exe lance_gradio_video.py --gpus 0 --server-port 7860
.venv\Scripts\python.exe lance_gradio_video.py --gpus 0 --server-port 7860 --fp8
```

Оба скрипта Gradio поддерживают многомодульный вывод (`--gpus 0,1,2,3`) и режим `--fp8` для снижения использования видеопамяти (~50% экономии).

### Бенчмарки

#### Оценка DPG-Bench

<div align="center">
<table align="center">
  <thead>
    <tr>
      <th align="left">Модели</th>
      <th align="center">#&nbsp;Парам.</th>
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
      <td align="center" colspan="8"><i>Только генеративные модели</i></td>
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
      <td align="center" colspan="8"><i>Унифицированные модели</i></td>
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
      <td align="left">🌟 <b>Lance (наша)</b></td><td align="center"><b>3B</b></td><td align="center"><b>83.89</b></td><td align="center"><b>91.07</b></td><td align="center"><b>89.36</b></td><td align="center"><b>93.38</b></td><td align="center"><b>80.80</b></td><td align="center"><b>84.67</b></td>
    </tr>
  </tbody>
</table>
</div>

<p align="center"><em><sup>†</sup> — методы, использующие LLM-реврайтеры для переписывания промптов перед генерацией.</em></p>

#### Оценка GenEval

<div align="center">
<table align="center">
  <thead>
    <tr>
      <th align="left">Модели</th>
      <th align="center">#&nbsp;Парам.</th>
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
      <td align="center" colspan="9"><i>Только генеративные модели</i></td>
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
      <td align="center" colspan="9"><i>Унифицированные модели</i></td>
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
      <td align="left">🌟 <b>Lance (наша)</b></td><td align="center"><b>3B</b></td><td align="center"><b>1.00</b></td><td align="center"><b>0.94</b></td><td align="center"><b>0.84</b></td><td align="center"><b>0.97</b></td><td align="center"><b>0.87</b></td><td align="center"><b>0.81</b></td><td align="center"><b>0.90</b></td>
    </tr>
  </tbody>
</table>
</div>

<p align="center"><em><sup>†</sup> — методы, использующие LLM-реврайтеры для переписывания промптов перед генерацией.</em></p>

#### Оценка GEdit-Bench

<div align="center">
<table align="center">
  <thead>
    <tr>
      <th align="left">Модели</th>
      <th align="center">#&nbsp;Парам.</th>
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
      <td align="center" colspan="14"><i>Только генеративные модели</i></td>
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
      <td align="center" colspan="14"><i>Унифицированные модели</i></td>
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
      <td align="left">🌟 <b>Lance (наша)</b></td><td align="center"><b>3B</b></td><td align="center"><b>7.73</b></td><td align="center"><u>7.74</u></td><td align="center"><b>7.28</b></td><td align="center"><b>7.83</b></td><td align="center"><b>7.50</b></td><td align="center"><b>7.03</b></td><td align="center"><u>7.64</u></td><td align="center"><b>7.85</b></td><td align="center"><b>7.71</b></td><td align="center">4.46</td><td align="center"><b>7.57</b></td><td align="center"><b>7.30</b></td>
    </tr>
  </tbody>
</table>
</div>

#### Оценка VBench (генерация видео)

<div align="center">
<table align="center">
  <thead>
    <tr>
      <th align="left">Тип</th>
      <th align="left">Модель</th>
      <th align="center">#&nbsp;Парам.</th>
      <th align="center">Общий балл ↑</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td align="center" rowspan="12"><i>Только генерация</i></td>
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
      <td align="center" rowspan="6"><i>Унифицированные</i></td>
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
      <td align="left">🌟 <b>Lance (наша)</b></td><td align="center"><b>3B</b></td><td align="center"><b>85.11</b></td>
    </tr>
  </tbody>
</table>
</div>

#### Запуск бенчмарков

Готовые скрипты для запуска бенчмарков находятся в `benchmarks/`:

| Бенчмарк                  | Модальность | Скрипт                                                        |
|---------------------------|-------------|---------------------------------------------------------------|
| GenEVAL (генерация изобр.)| Изображения | `benchmarks/image_gen/GenEVAL/sample_GenEVAL.sh`              |
| DPG (генерация изобр.)    | Изображения | `benchmarks/image_gen/DPG/sample_DPG.sh`                      |
| GEdit (редакт. изобр.)    | Изображения | `benchmarks/image_gen/GEdit/sample_GEdit.sh`                  |
| VBench (генерация видео)  | Видео       | `benchmarks/video_gen/Vbench/sample_vbench.sh`                |


## 📄 Лицензия

Copyright 2025 Bytedance Ltd. and/or its affiliates.

## 🙏 Благодарности

Мы благодарим авторов [BAGEL](https://github.com/ByteDance-Seed/bagel), [Qwen2.5-VL-3B-Instruct](https://huggingface.co/Qwen/Qwen2.5-VL-3B-Instruct) и [Wan2.2](https://github.com/Wan-Video/Wan2.2) за открытые исследования и вклад.

## 💖 Цитирование

Если **Lance** оказалась полезной для вашего проекта или исследования, поставьте 🌟 этому репозиторию и цитируйте нашу работу:

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

## 📞 Контакты

По вопросам, багам или предложениям о сотрудничестве обращайтесь к [Mengqi Huang](https://corleone-huang.github.io/) и [Jianzhu Guo](https://guojianzhu.com/).
