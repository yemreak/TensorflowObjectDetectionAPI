# Tensorflow Kurulumu <!-- omit in toc -->

## İçerikler <!-- omit in toc -->

- [Temel Bilgileri](#temel-bilgileri)
  - [Hangi İşletim Sistemi Daha iyi](#hangi-i%CC%87%C5%9Fletim-sistemi-daha-iyi)
- [Tensorflow Kurulumu](#tensorflow-kurulumu)
  - [Anaconda Kurulumu](#anaconda-kurulumu)
  - [Tensorflow CPU veya GPU Kurulumu](#tensorflow-cpu-veya-gpu-kurulumu)
    - [Sanal Ortam Oluşturma ve Üzerine Kurma](#sanal-ortam-olu%C5%9Fturma-ve-%C3%BCzerine-kurma)
  - [Kurulumu Test Etme](#kurulumu-test-etme)
- [Tensorflow Algılama Modellerinin Kurulumu](#tensorflow-alg%C4%B1lama-modellerinin-kurulumu)
  - [Gerekli Paketlerin Kurulumları](#gerekli-paketlerin-kurulumlar%C4%B1)
    - [Linux için OpenCv Kurulumu](#linux-i%C3%A7in-opencv-kurulumu)
    - [Script Dosyaları için Gerekli Modüller](#script-dosyalar%C4%B1-i%C3%A7in-gerekli-mod%C3%BCller)
  - [Tensorflow Models İndirilmesi](#tensorflow-models-i%CC%87ndirilmesi)
    - [Models Klasörü Yapısı](#models-klas%C3%B6r%C3%BC-yap%C4%B1s%C4%B1)
  - [Protobuflarların İşlenmesi](#protobuflarlar%C4%B1n-i%CC%87%C5%9Flenmesi)
  - [Obje Algılama Kütüphanelerinin Derlenmesi ve Yüklenmesi](#obje-alg%C4%B1lama-k%C3%BCt%C3%BCphanelerinin-derlenmesi-ve-y%C3%BCklenmesi)
  - [Gerekli Ortam Değişkenlerinin Tanımlanması](#gerekli-ortam-de%C4%9Fi%C5%9Fkenlerinin-tan%C4%B1mlanmas%C4%B1)
    - [Anaconda Ortamı için Otomatik Tanımlama](#anaconda-ortam%C4%B1-i%C3%A7in-otomatik-tan%C4%B1mlama)
  - [Modellerin Kurulumunu Test Etme](#modellerin-kurulumunu-test-etme)
- [LabelImg Kurulumu](#labelimg-kurulumu)
  - [LabelImg Kaynak Kodlarını Derleme](#labelimg-kaynak-kodlar%C4%B1n%C4%B1-derleme)
    - [LabelImg için Sanal Ortam Oluşturma](#labelimg-i%C3%A7in-sanal-ortam-olu%C5%9Fturma)
    - [LabelImg Paketlerini Kurma ve Derleme](#labelimg-paketlerini-kurma-ve-derleme)
    - [LabelImg Kurulumunu Test Etme](#labelimg-kurulumunu-test-etme)

<div class="page"/>

## Temel Bilgileri

- Python dili üzerinde makine öğrenimi gibi işlemler için Google tarafından sunulan kütüphanedir.
- Yabancı Kaynaklar: [📺](https://youtu.be/COlbP62-B-U) [📄](https://buildmedia.readthedocs.org/media/pdf/tensorflow-object-detection-api-tutorial/latest/tensorflow-object-detection-api-tutorial.pdf)
- Tensorflow araştırma modellerine [buradan][Tensorflow research] erişebilirsin
  - Her modelin içerisindeki `g3doc` adlı klasör dökümantasyonunu barındırır

### Hangi İşletim Sistemi Daha iyi

Linux daha iyidir 🐧

Kaynak için [buraya][Tensorflow hangi işletim sistemi için daha iyi] bakabilrisin.

## Tensorflow Kurulumu

- Tensorflow anaconda üzerinden daha sağlıklı, taşınabilir ve verimli çalışabilmekte
- Anacondanın sanal ortamları, paketlerin çakışmasını engelleyecektir
- Anaconda'nın tensorflowdaki avantajı için [buraya](https://www.anaconda.com/tensorflow-in-anaconda/) göz atabilirsin.

### Anaconda Kurulumu

- Anaconda kurulumu için [buraya](../Uygulama%20Notlar%C4%B1/Anaconda.md#anaconda-kurulumu) tıklayarak onun için hazırladığım dökümana erişebilirsin.

### Tensorflow CPU veya GPU Kurulumu

- Bu kurulum CPU kurulumu olarak da geçmekte
- GPU kurulumu CPU'ya nazaran oldukça hızlı eğitim seçeneği sağlar
- GPU kurulumu için gereksinimleri sağlıyorsanız GPU kurulumu (tensorflow-gpu) yapmanız tavsiye edilir

#### Sanal Ortam Oluşturma ve Üzerine Kurma

```bat
conda create -n tensorflow tensorflow # CPU kurulumu
conda create -n tensorflow tensorflow-gpu # GPU kurulumu
```

### Kurulumu Test Etme

Alttaki komnut ile 'Hello, TensorFlow!' çıktısın almanız gerekmektedir.

```bat
python -c
import tensorflow as tf
hello = tf.constant('Hello, TensorFlow!')
sess = tf.Session()
print(sess.run(hello))
```

## Tensorflow Algılama Modellerinin Kurulumu

- Algılama modelleri tabloma erişmek için [buraya](detection_models\tensorflow_algılama_modelleri.pdf) tıklayabilirsin
  - Resmi sitesi için [buraya](https://github.com/tensorflow/models/blob/master/research/object_detection/g3doc/detection_model_zoo.md) bakabilirsin
- Video üzerinden açıklama için [buraya](https://youtu.be/COlbP62-B-U) bakabilirsin

> Resmi açıklamalar `models/research/object_detection/g3doc` dizinindedir.

### Gerekli Paketlerin Kurulumları

Tensorflow modellerini kullanabilmek için alttaki kurulumlara da ihtiyaç olabilmekte:

```bat
conda install opencv pillow matplotlib pandas jupyter
```

> Modül bulunamaması gibi durumlarda `lxml`, `protobuf` paketlerini yüklemeyi deneyebilirsin.

#### Linux için OpenCv Kurulumu

GTK ve FFMPEG hatasını engellemek için pip ile kurulum yapın

```sh
pip install opencv-contrib-python
```

#### Script Dosyaları için Gerekli Modüller

```bat
pip install pynput # detect_from_desktop
```

### Tensorflow Models İndirilmesi

Alttaki talimatler ve komutlar yardımıyla tensorflow modellerini kurun:

- Modelleri indirmek için [buraya](https://github.com/tensorflow/models/archive/master.zip) tıklayabilirsin
- İstersen [buraya](https://github.com/tensorflow/models) tıklayarak github linkine erişebilirsin
- İndirdiğiniz dosyanın içindekileri `models` dizinine koymanız gerekmektedir.

> Bu adından sonrası `models/research/` dizininde gerçekleştirilmelidir.

**Windows:**

```bat
powershell.exe Expand-Archive models-master.zip .
ren models-master models
move models %TENSORFLOW%
cd %TENSORFLOW%\models\research\
```

**Linux:**

```sh
unzip models-master.zip .
mv models-master $TENSORFLOW/models
cd $TENSORFLOW/model/research
```

#### Models Klasörü Yapısı

```txt
+ models
    + offical
    + research
    + sample
    ...
```

### Protobuflarların İşlenmesi

Protobuf dosyaları (`.proto` uzantılı olan dosyalar) python kodlanı oluşturmak için kullanılan dosyalardır. `TensorFlow/models/research/` dizininde

**Windows:**

```bat
for /f %i in ('dir /b object_detection\protos\*.proto') do protoc object_detection\protos\%i --python_out=.
```

**Linux:**

```sh
protoc object_detection/protos/*.proto --python_out=.
```

> Protobuflarların işlenmesiyle `.py` uzantılı dosyalar oluşacaktır

### Obje Algılama Kütüphanelerinin Derlenmesi ve Yüklenmesi

```sh
# TensorFlow/models/research/ dizininde
python setup.py build
python setup.py install
```

### Gerekli Ortam Değişkenlerinin Tanımlanması

Eğer daha önceden tanımlı `PYTHONPATH` ortam değişkeniniz **yoksa ilk olan**, **varsa ikinci olan** komutu kullanın.

> Bu ortam değişkenlerinin **terminalin her açılışında yazılması** gerekmetedir.

```bat
set PYTHONPATH=%TENSORFLOW%\models\research;%TENSORFLOW%\models\research\slim;%TENSORFLOW%\models\research\object_detection
```

```bat
set PYTHONPATH=%PYTHONPATH%;%TENSORFLOW%\models\research;%TENSORFLOW%\models\research\slim;%TENSORFLOW%\models\research\object_detection
```

#### Anaconda Ortamı için Otomatik Tanımlama

- Her `conda activate <ortam_ismi>` komutu yazıldığında ortamlar dahil edilir
- Her `conda deactivate` yazıldığında ortamlar kaldırılır

**Windows:**

```bat
cd <conda_ortamı_yolu>
mkdir .\etc\conda\activate.d
echo set PYTHONPATH=%TENSORFLOW%\models\research;%TENSORFLOW%\models\research\slim;%TENSORFLOW%\models\research\object_detection > .\etc\conda\activate.d\env_vars.bat
```

**Linux:**

Resmi kaynak için [buraya](https://conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html#macos-and-linux) bakabilirsin.

```sh
cd <conda_ortamı_yolu>
mkdir -p ./etc/conda/activate.d
mkdir -p ./etc/conda/deactivate.d
echo export PYTHONPATH=${PYTHONPATH}:${TENSORFLOW}/models/research:${TENSORFLOW}/models/research/slim:${TENSORFLOW}/models/research/object_detection > etc/conda/activate.d/env_vars.sh
echo unset PYTHONPATH > etc/conda/deactivate.d/env_vars.sh
```

- `<conda_ortamı_yolu>` Conda ortamının kurulduğu yol
  - *Örn: %USERPROFILE%\Anaconda3\envs\tensorflow-cpu*

### Modellerin Kurulumunu Test Etme

Jupyter notebook ile API'ları eval etmemzi gerekmekte.

```sh
cd object_detection
jupyter notebook
```

> Jupyter notebook hakkında bilgi sahibi değilsen [buraya](https://www.youtube.com/watch?v=COlbP62-B-U&feature=youtu.be&t=7m23s) tıklayarak ne yapman gerektiğini öğrenebilirsin.

## LabelImg Kurulumu

- LabelImg tensorflow modelleri için etiketleme amaçlı kullanılmaktadır
- Derlenmiş sürümünü indirmek için [buraya](http://tzutalin.github.io/labelImg/) tıklayabilirsin

> İndirilen dosyayı `%TENSORFLOW%\addons` dizinine atmanız daha verimli bir çalışma sağlayacaktır.

### LabelImg Kaynak Kodlarını Derleme

#### LabelImg için Sanal Ortam Oluşturma

Tensorflow ortamının alt paketlerini etkilememsi için ek bir sanal ortamda kurulum sağlamalıyız.

```sh
conda create -n labelImg pyqt # QT grafik kütüphanesi
conda activate labelImg
conda install -c anaconda lxml
```

#### LabelImg Paketlerini Kurma ve Derleme

Paketlerin kurulumu için alttaki talimatları sırayla uygulayın:

- LabelImg dosyalarını indirmek için [buraya](https://github.com/tzutalin/labelImg/archive/master.zip) tıklayın
- Diğer işlemler için indirdiğiniz dosya dizininde bat açıp alttaki komutları yazın

```sh
# labelImg-master.zip dizininde
powershell.exe Expand-Archive labelImg-master.zip .
ren labelImg-master labelImg
mkdir %TENSORFLOW%\addons
move labelImg %TENSORFLOW%\addons
cd %TENSORFLOW%\addons\labelImg
pyrcc5 -o resources.py resources.qrc # QT grafiklerinin oluşturulması
```

> *'pyrcc5' is not recognized as an internal or external command* hatası gelirse, yüklediğiniz `pyqt` sürümüne göre komutu kullanın (`pyrcc<pyqt_sürümü_ilk_basamağı>`)

#### LabelImg Kurulumunu Test Etme

```sh
conda activate tensorflow-cpu
cd %TENSORFLOW%\addons\labelImg
python labelImg.py
# python labelImg.py [IMAGE_PATH] [PRE-DEFINED CLASS FILE]
```

[Tensorflow hangi işletim sistemi için daha iyi]: https://www.quora.com/Is-Linux-better-than-Windows-for-using-TensorFlow
[Tensorflow research]: https://github.com/tensorflow/models/tree/master/research
