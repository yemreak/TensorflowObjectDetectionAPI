# Hata Notları ve Açıklamalar <!-- omit in toc -->

## İçerikler <!-- omit in toc -->

- [Linux üzerinde GTK ve FFMPEG Hataları](#linux-%C3%BCzerinde-gtk-ve-ffmpeg-hatalar%C4%B1)
- ['conda' is not recognized as an internal or external command](#conda-is-not-recognized-as-an-internal-or-external-command)
- ['...' is not recognized as an internal or external command](#is-not-recognized-as-an-internal-or-external-command)
- ['ImportError: No module named' Hataları](#importerror-no-module-named-hatalar%C4%B1)
- ['dict_keys' object does not support indexing](#dictkeys-object-does-not-support-indexing)
- [Object was never used (type <class 'tensorflow.python.framework.ops.Tensor'>)](#object-was-never-used-type-class-tensorflowpythonframeworkopstensor)
- ['unicodeescape' codec can't decode bytes in position](#unicodeescape-codec-cant-decode-bytes-in-position)
- [Allocation of X exceeds 10% of system memory](#allocation-of-x-exceeds-10-of-system-memory)
- [google.protobuf.text_format.ParseError, Expected string but found](#googleprotobuftextformatparseerror-expected-string-but-found)
- [Value Error: No Variable to Save](#value-error-no-variable-to-save)

## Linux üzerinde GTK ve FFMPEG Hataları

Linux için hataları engellemek adına `conda` üzerinden değil `pip` üzerinden opencv kurulmalıdır.

```sh
pip install opencv-contrib-python
```

## 'conda' is not recognized as an internal or external command

`Anaconda Prompt` üzerinden terminal işlemlerinize devam etmeniz durumunda sorun gidecektir.

## '...' is not recognized as an internal or external command

[Gerekli Paketlerin Kurulumları](#gerekli-paketlerin-kurulumlar%C4%B1) tamamnlanmadığı için bu hata ile karşılaşıyor olabilirsiniz.

## 'ImportError: No module named' Hataları

PythonPath ayarlanmadığı için bu hata ile karşılaşmaktasınız.

```sh
set PYTHONPATH=%TENSORFLOW%\models\research;%TENSORFLOW%\models\research\slim;%TENSORFLOW%\models\research\object_detection
```

> Dökümandaki ilgili alana yönelmek için [buraya](#gerekli-ortam-de%C4%9Fi%C5%9Fkenlerinin-tan%C4%B1mlanmas%C4%B1) tıklayabilrisin.

## 'dict_keys' object does not support indexing

Açıklama linki için [buraya](https://github.com/tensorflow/models/pull/6044/files) bakabilirsin.

```sh
start %TENSORFLOW%\models\research\object_detection\models\feature_map_generators.py
```

- Satır 518'deki yere alttaki kodu yapıştırın

```py
image_features = image_features[list(image_features.keys())[0]]
```

## Object was never used (type <class 'tensorflow.python.framework.ops.Tensor'>)

> Yakında..

## 'unicodeescape' codec can't decode bytes in position

Modelinizin `.config` dosyanıza yazdığın tam yol verilerinde `\` yerine `/` veya `\\` kullanmalısınız.

## Allocation of X exceeds 10% of system memory

- Rastgeldiğim bu [kaynağa](https://github.com/tensorflow/tensorflow/issues/18736#issuecomment-385976699) göre **ssd_mobilenet_v2_coco modeline** özgü bir hatadır.
- Hatanın çözüm kaynağı için [buraya](https://github.com/tensorflow/tensorflow/issues/18736#issuecomment-388709455) tıklayabilirsin

<div class="page"/>

## google.protobuf.text_format.ParseError, Expected string but found

Config dosyalarının text editör üzerinden düzenlemesi durumunda, türkçe karakterler için text editörü yapıyı değiştirmekte ve tensorflow bunu algılayamamaktadır. Sorunu çözmek için alttakiler yardımıyla `.config` dosyasını düzenleyin:

- VsCode
- Notepad++
- Sublime
- Atom

> Harici kaynak için [buraya](https://github.com/tensorflow/models/issues/1897#issuecomment-313879598) bakabilirsin.

## Value Error: No Variable to Save

Model eğitimi yapıldığı sırada gelen bir hatadır, çözümü için `.config`dosyanızı bu şekilde düzenleyin:

```cfg
train_config: {
  ...
  fine_tune_checkpoint: "./pre_trained_model/model.ckpt"
  fine_tune_checkpoint_type:  "detection"
  ...
}
```

> `ssd_mobilenet_v1_quantized_300x300_coco14_sync` modelinde test edilmiştir.
