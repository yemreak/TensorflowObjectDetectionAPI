# Modeli Eğitme <!-- omit in toc -->

## İçerikler <!-- omit in toc -->

- [Gereksinimler](#gereksinimler)
- [Modeli Eğitme İşlemi](#modeli-e%C4%9Fitme-i%CC%87%C5%9Flemi)
  - [Eğitim Scriptlerini Çalışma Alanına Kopyalama](#e%C4%9Fitim-scriptlerini-%C3%A7al%C4%B1%C5%9Fma-alan%C4%B1na-kopyalama)
  - [Eğitimde Raporlanacak Seviyeyi Ayarlama (isteğe Bağlı)](#e%C4%9Fitimde-raporlanacak-seviyeyi-ayarlama-iste%C4%9Fe-ba%C4%9Fl%C4%B1)
  - [Modeli train.py Dosyası ile Eğitime](#modeli-trainpy-dosyas%C4%B1-ile-e%C4%9Fitime)
    - [Eğitime Başladığında Gelen Örnek Çıktı](#e%C4%9Fitime-ba%C5%9Flad%C4%B1%C4%9F%C4%B1nda-gelen-%C3%B6rnek-%C3%A7%C4%B1kt%C4%B1)
  - [Modeli model_main.py Dosyası ile Eğitme](#modeli-modelmainpy-dosyas%C4%B1-ile-e%C4%9Fitme)
    - [Eğitim için Gereksinimlerin Kurulması](#e%C4%9Fitim-i%C3%A7in-gereksinimlerin-kurulmas%C4%B1)
    - [Windows için PyCocoTools Kurulumu](#windows-i%C3%A7in-pycocotools-kurulumu)
    - [Linux için Cocotools](#linux-i%C3%A7in-cocotools)
    - [Eğitimi Hazırlama ve Başlatma](#e%C4%9Fitimi-haz%C4%B1rlama-ve-ba%C5%9Flatma)
  - [Eğitimi Etkileyen Faktörler](#e%C4%9Fitimi-etkileyen-fakt%C3%B6rler)
  - [Eğitim İşlemini TensorBoard Kullanarak Takip Etme](#e%C4%9Fitim-i%CC%87%C5%9Flemini-tensorboard-kullanarak-takip-etme)
  - [Sonuç Grafiğini Dışarı Aktarma](#sonu%C3%A7-grafi%C4%9Fini-d%C4%B1%C5%9Far%C4%B1-aktarma)

## Gereksinimler

Özelleştirilmiş model eğitmek için alttakilerin yapılmış olması gerekmektedir:

- [Tensorflow CPU veya GPU kurulumu](#tensorflow-cpu-veya-gpu-kurulumu)
- [Tensorflow modellerinin kurulumu](#tensorflow-modellerinin-i%CC%87ndirilmesi)
- [LabelImg kurulumu](#labelimg-kurulumu)

## Modeli Eğitme İşlemi

Modeli eğitmek için `train.py` script dosyasını kullanacağız.

> Modeli önerilen dosya olan `model_main.py` ile eğitmek için [buraya](#modeli-modelmainpy-dosyas%C4%B1-ile-e%C4%9Fitme) bakmalısın.

### Eğitim Scriptlerini Çalışma Alanına Kopyalama

Çalışma ortamının düzgün ilerlemesi adına alttaki komut ile gerekli yere scripti kopyalayalım

```sh
copy %TENSORFLOW%\models\research\object_detection\legacy\train.py %TENSORFLOW%\workspace\example_detection
copy %TENSORFLOW%\models\research\object_detection\model_main.py
```

### Eğitimde Raporlanacak Seviyeyi Ayarlama (isteğe Bağlı)

Eğitimde uyarı ve bilgileri gizlemek için `TF_CPP_MIN_LOG_LEVEL` adlı ortam değişkeni oluşturup seviyesini tanımlıyoruz

```sh
set TF_CPP_MIN_LOG_LEVEL=2
```

### Modeli train.py Dosyası ile Eğitime

`# TODO Daha düzgün ve detaylı linkli bir yazı ekle`

> Eskimiş olan bir eğitim kodudur, `model_main.py` kod dosyası tensorflow tarafından önerilir.

```sh
python train.py --logtostderr --train_dir=train/ --pipeline_config_path=training\<yapılandırma_dosyası>
```

- `<yapılandırma_dosyası>` Modelimizin yapılandırma dosyasının tam adı
  - **training** klasörüne attığımız yapılandırma dosyaları
  - *Örn: ssd_inception_v2_coco.config*

#### Eğitime Başladığında Gelen Örnek Çıktı

```sh
INFO:tensorflow:depth of additional conv before box predictor: 0
INFO:tensorflow:depth of additional conv before box predictor: 0
INFO:tensorflow:depth of additional conv before box predictor: 0
INFO:tensorflow:depth of additional conv before box predictor: 0
INFO:tensorflow:depth of additional conv before box predictor: 0
INFO:tensorflow:depth of additional conv before box predictor: 0
INFO:tensorflow:Restoring parameters from ssd_inception_v2_coco_2017_11_17/model.ckpt
INFO:tensorflow:Running local_init_op.
INFO:tensorflow:Done running local_init_op.
INFO:tensorflow:Starting Session.
INFO:tensorflow:Saving checkpoint to path training\model.ckpt
INFO:tensorflow:Starting Queues.
INFO:tensorflow:global_step/sec: 0
INFO:tensorflow:global step 1: loss = 13.8886 (12.339 sec/step)
INFO:tensorflow:global step 2: loss = 16.2202 (0.937 sec/step)
INFO:tensorflow:global step 3: loss = 13.7876 (0.904 sec/step)
INFO:tensorflow:global step 4: loss = 12.9230 (0.894 sec/step)
INFO:tensorflow:global step 5: loss = 12.7497 (0.922 sec/step)
INFO:tensorflow:global step 6: loss = 11.7563 (0.936 sec/step)
INFO:tensorflow:global step 7: loss = 11.7245 (0.910 sec/step)
INFO:tensorflow:global step 8: loss = 10.7993 (0.916 sec/step)
INFO:tensorflow:global step 9: loss = 9.1277 (0.890 sec/step)
INFO:tensorflow:global step 10: loss = 9.3972 (0.919 sec/step)
INFO:tensorflow:global step 11: loss = 9.9487 (0.897 sec/step)
INFO:tensorflow:global step 12: loss = 8.7954 (0.884 sec/step)
INFO:tensorflow:global step 13: loss = 7.4329 (0.906 sec/step)
INFO:tensorflow:global step 14: loss = 7.8270 (0.897 sec/step)
INFO:tensorflow:global step 15: loss = 6.4877 (0.894 sec/step)
```

### Modeli model_main.py Dosyası ile Eğitme

Bu dosya ile eğitim önerilen eğitim şeklidir.

- `train.py` ile eğitime nazaran, kaldığı yerden devam eder
  - 1000 adım yapıldıysa, ikinci eğitimi 1200 yaptığınızda 200 adım eğitir
  - `train.py` eğitiminde modelin sonucunun ayırılıp, sonuç üzerinden eğitim yapılması gerekir

> Eğitim dosyaları arasında **performans veya kalite farkı yoktur**, kaynak için [buraya](https://github.com/tensorflow/models/issues/6100) bakabilirsin.

#### Eğitim için Gereksinimlerin Kurulması

Eğitim için `pycocotools` kurulumu gereklidir

#### Windows için PyCocoTools Kurulumu

Windows desteğiyle kurulum yapmak için alttaki komutu koşturun

```sh
pip install git+https://github.com/philferriere/cocoapi.git#subdirectory=PythonAPI
```

> Açıklama için [buraya](https://github.com/philferriere/cocoapi) bakabilirsin.

#### Linux için Cocotools

```sh
git clone https://github.com/cocodataset/cocoapi.git
cd cocoapi/PythonAPI
make
cp -r pycocotools /content/models/research/
cd ../..
rm -rf cocoapi
```

#### Eğitimi Hazırlama ve Başlatma

Resmi kaynağa ulaşmak için [buraya](https://github.com/tensorflow/models/blob/master/research/object_detection/g3doc/running_locally.md) bakabilirsin.

- `model_main.py` eğitim için önerilen dosyadır
- Varsayılan olarak ekrana raporlama yapmaz, yapmasını isterseniz [buraya](https://github.com/EdjeElectronics/TensorFlow-Object-Detection-API-Tutorial-Train-Multiple-Objects-Windows-10/issues/184#issuecomment-437811347) bakabilirsiniz

```sh
# From the tensorflow/models/research/ directory
PIPELINE_CONFIG_PATH={path to pipeline config file}
MODEL_DIR={path to model directory}
NUM_TRAIN_STEPS=50000
SAMPLE_1_OF_N_EVAL_EXAMPLES=1
python object_detection/model_main.py \
    --pipeline_config_path=${PIPELINE_CONFIG_PATH} \
    --model_dir=${MODEL_DIR} \
    --num_train_steps=${NUM_TRAIN_STEPS} \
    --sample_1_of_n_eval_examples=$SAMPLE_1_OF_N_EVAL_EXAMPLES \
    --alsologtostderr
```

### Eğitimi Etkileyen Faktörler

Training times can be affected by a number of factors such as:

- The computational power of you hardware (either CPU or GPU): Obviously, the more powerful your PC is, the faster the training process.

- Whether you are using the TensorFlow CPU or GPU variant: In general, even when compared to the best CPUs, almost any GPU graphics card will yield much faster training and detection speeds. As a matter of
fact, when I first started I was running TensorFlow on my Intel i7-5930k (6/12 cores @ 4GHz, 32GB RAM)
and was getting step times of around 12 sec/step, after which I installed TensorFlow GPU and training the
very same model -using the same dataset and config files- on a EVGA GTX-770 (1536 CUDA-cores @
1GHz, 2GB VRAM) I was down to 0.9 sec/step!!! A 12-fold increase in speed, using a “low/mid-end”
graphics card, when compared to a “mid/high-end” CPU.

- How big the dataset is: The higher the number of images in your dataset, the longer it will take for the
model to reach satisfactory levels of detection performance.

- The complexity of the objects you are trying to detect: Obviously, if your objective is to track a black ball
over a white background, the model will converge to satisfactory levels of detection pretty quickly. If on
the other hand, for example, you wish to detect ships in ports, using Pan-Tilt-Zoom cameras, then training
will be a much more challenging and time-consuming process, due to the high variability of the shape and
size of ships, combined with a highly dynamic background.

- And many, many, many, more. . . .

### Eğitim İşlemini TensorBoard Kullanarak Takip Etme

**Anaconda Prompt** üzerinden alttaki komutlar uygulanır:

```sh
activate tensorflow_cpu # ya da gpu
tensorboard --logdir=training\
```

Alttaki gibi bir çıktı gelmesi gerekmekte:

```sh
TensorBoard 1.6.0 at http://YOUR-PC:6006 (Press CTRL+C to quit)
```

> Çıktıyı görüntülemek için verilen url'i tarayıcına kopyalaman yeterlidir.

### Sonuç Grafiğini Dışarı Aktarma

**Anaconda Prompt** üzerinden alttaki komutlar uygulanır:

```sh
activate tensorflow_cpu # ya da gpu

copy %TENSORFLOW%\models\research\object_detection/export_inference_graph.py %TENSORFLOW%\workspace\example_detection

cd %TENSORFLOW%\workspace\example_detection

python export_inference_graph.py --input_type image_tensor --pipeline_config_path training/<yapılandırma_dosyası> --trained_checkpoint_prefix training/model.ckpt-<checkpoint> --output_directory trained-inference-graphs/output_inference_graph_v1.pb
```

- `<yapılandırma_dosyası>` Modelimizin yapılandırma dosyasının tam adı
  - **training** klasörüne attığımız yapılandırma dosyaları
  - *Örn: ssd_inception_v2_coco.config*
- `<checkpoint>` **example_detection/training** dizinindeki gösterilmek istenen adımın numarası
  - *Örn: 13302*
