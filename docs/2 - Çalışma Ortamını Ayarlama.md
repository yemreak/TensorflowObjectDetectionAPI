# Tensorflow Çalışma Ortamı <!-- omit in toc -->

## İçerikler <!-- omit in toc -->

- [Tensorflow Dizininizi Geçici Ortam Değişkenlerine Ekleme](#tensorflow-dizininizi-ge%C3%A7ici-ortam-de%C4%9Fi%C5%9Fkenlerine-ekleme)
- [Tensorflow Dizininizi Kalıcı Olarak Ortam Değişkenlerine Ekleme](#tensorflow-dizininizi-kal%C4%B1c%C4%B1-olarak-ortam-de%C4%9Fi%C5%9Fkenlerine-ekleme)
- [Temel Klasörlerin Oluşturulması](#temel-klas%C3%B6rlerin-olu%C5%9Fturulmas%C4%B1)
  - [Windows için Temel Klasörleri Oluşturma](#windows-i%C3%A7in-temel-klas%C3%B6rleri-olu%C5%9Fturma)
  - [Linux için Temel Klasörleri Oluşturma](#linux-i%C3%A7in-temel-klas%C3%B6rleri-olu%C5%9Fturma)
- [Temel Dizin Yapısı](#temel-dizin-yap%C4%B1s%C4%B1)
- [Çalışma Alanı Yapısı](#%C3%A7al%C4%B1%C5%9Fma-alan%C4%B1-yap%C4%B1s%C4%B1)
- [Data Dizini Yapısı](#data-dizini-yap%C4%B1s%C4%B1)
- [Models Dizini Yapısı](#models-dizini-yap%C4%B1s%C4%B1)

<div class="page"/>

## Tensorflow Dizininizi Geçici Ortam Değişkenlerine Ekleme

Alttaki komut yardımıyla açık olan cmd ekranına ortam değişkeni tanımlayabilirsiniz.

```sh
set TENSORFLOW=<dizin_yolu> # Windows
export TENSORFLOW=<dizin_yolu> # Linux
```

- `<dizin_yolu>` Tensorflow'u kurmak istediğiniz dizin
  - *Örn: "C:\Tensorflow"*

## Tensorflow Dizininizi Kalıcı Olarak Ortam Değişkenlerine Ekleme

- Bilgisayarıma sağ tıklayın `Ayarlar` kısmına girin
- Sol alanda `Gelişmiş Sistem Ayarları`'na tıklayın
- Açılan ekranda `Ortam Değişkenleri` butonuna tıklayın
- Üst kısımdaki kullanıcı değişkenleri alanında `Yeni` butonuna tıklayın
- Değişken ismine: `Tensorflow` Değerine: 'dizin yolunuzu' yazın

## Temel Klasörlerin Oluşturulması

İlerideki yapı için bu dizinin yolu `%TENSORFLOW%` olarak ifade edilecektir.

Proje yapısı tavsiye edilen dizin yapısına örnek olacak şekilde oluşturulmuştur.

> Düzgün ve verimli çalışmak için buradaki yapıyı kullanmanız önerilir.

### Windows için Temel Klasörleri Oluşturma

```bat
mkdir %TENSORFLOW%\workspace\example_detection
mkdir %TENSORFLOW%\workspace\example_detection\data
mkdir %TENSORFLOW%\workspace\example_detection\images\train
mkdir %TENSORFLOW%\workspace\example_detection\images\eval
mkdir %TENSORFLOW%\workspace\example_detection\models
```

### Linux için Temel Klasörleri Oluşturma

```sh
mkdir -P $TENSORFLOW/workspace/example_detection
mkdir -P $TENSORFLOW/workspace/example_detection/data
mkdir -P $TENSORFLOW/workspace/example_detection/images/train
mkdir -P $TENSORFLOW/workspace/example_detection/images/eval
mkdir -P $TENSORFLOW/workspace/example_detection/models
```

<div class="page"/>

## Temel Dizin Yapısı

```txt
+ addons
+ docs
+ models
+ scripts
+ workspace
    + example_detection
        + data
        + models
            + <model_ismi>
                + eval
                + train
                - *.config
                ...
            + <model_ismi>
                + eval
                + train
                - *.config
                ...
            ...
        ...
    + example2_detection
        + data
        + models
            + <model_ismi>
                + eval
                + train
                - *.config
                ...
            + <model_ismi>
                + eval
                + train
                - *.config
                ...
            ...
        ...
    ...
```

| Dizin     | Açıklama                           |
| --------- | ---------------------------------- |
| addons    | LabelImg vs.                       |
| docs      | Dökümanlar                         |
| models    | Tensorflow Models dosyası          |
| scripts   | Kullanacağınız ortak kod parçaları |
| workspace | Çalışma Alanı                      |

<div class="page"/>

## Çalışma Alanı Yapısı

```txt
+ workspace
    + example_detection
        + data
        + models
        ...
    + example2_detection
        + data
        + models
        ...
    ...
```

| Dizin | Açıklama                                                                      |
| ----- | ----------------------------------------------------------------------------- |
| data  | Eğitime katılacak verileri (*eval.record, train.record, label_map*) içeririr. |
| model | Eğitilecek modellerin dosyalarını içerir.                                     |

## Data Dizini Yapısı

```txt
+ example_detection
    + data
        - label_map.pbtxt
        - eval.record
        - train.record
    + models
    ...
...
```

| Dosya             | Açıklama                                                  |
| ----------------- | --------------------------------------------------------- |
| `label_map.pbtxt` | Etiket haritası dosyası                                   |
| `eval.record`     | Test için kullanılacak tensorflow kayıtları (TF record)   |
| `train.record`    | Eğitim için kullanılacak tensorflow kayıtları (TF record) |

<div class="page"/>

## Models Dizini Yapısı

```txt
+ example_detection
    + data
    + models
        + <model_ismi>
            + eval
            + train
            - *.config
            ...
        + <model_ismi>
            + eval
            + train
            - *.config
            ...
        ...
    ...
...
```

Her bir model için ayrı dizinler oluşturulur.

| İsim      | Tipi  | Açıklama                        |
| --------- | ----- | ------------------------------- |
| eval      | Dizin | Test sonuçları burada tutulur.  |
| train     | Dizin | Eğitim çıktıları burada tutulur |
| `.config` | Dosya | Yapılandırma dosyası            |

<div class="page"/>
