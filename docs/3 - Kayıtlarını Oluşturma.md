# Tensorflow Kayıtları Oluşturma <!-- omit in toc -->

## İçerikler <!-- omit in toc -->

- [TFRecord'ların Oluşturulma Sırası](#tfrecordlar%C4%B1n-olu%C5%9Fturulma-s%C4%B1ras%C4%B1)
- [Resim Etiketleme İşlemi](#resim-etiketleme-i%CC%87%C5%9Flemi)
  - [LabelImg Kısayolları](#labelimg-k%C4%B1sayollar%C4%B1)
- [XML Düzenleme veya Hata Düzeltme Scriptleri](#xml-d%C3%BCzenleme-veya-hata-d%C3%BCzeltme-scriptleri)
  - [Verileri Yeniden Adlandırma ve XML Hatalarını Düzeltme](#verileri-yeniden-adland%C4%B1rma-ve-xml-hatalar%C4%B1n%C4%B1-d%C3%BCzeltme)
  - [Resimlerdeki Hataları Bulma](#resimlerdeki-hatalar%C4%B1-bulma)
  - [Etiketlenmemiş Resimleri Bulma](#etiketlenmemi%C5%9F-resimleri-bulma)
- [CVS Dosyalarını Oluşturma (XML -> CSV)](#cvs-dosyalar%C4%B1n%C4%B1-olu%C5%9Fturma-xml---csv)
- [CSV'lerden Resim Bilgilerini Analiz Etme](#csvlerden-resim-bilgilerini-analiz-etme)
- [Etiket Haritası (labelmap.pbtxt) Oluşturma](#etiket-haritas%C4%B1-labelmappbtxt-olu%C5%9Fturma)
- [TFRecord Oluşturma (CSV & labelmap -> TFRecord)](#tfrecord-olu%C5%9Fturma-csv--labelmap---tfrecord)
- [Bağlantıları (pipeline) Yapılandırma](#ba%C4%9Flant%C4%B1lar%C4%B1-pipeline-yap%C4%B1land%C4%B1rma)
  - [Modellin İndirilmesi ve Gerekli Yere Taşınması](#modellin-i%CC%87ndirilmesi-ve-gerekli-yere-ta%C5%9F%C4%B1nmas%C4%B1)
  - [Modellin Yapılandırma Dosyaları](#modellin-yap%C4%B1land%C4%B1rma-dosyalar%C4%B1)
  - [Modelin Yapılandırma Dosyasını Düzenleme](#modelin-yap%C4%B1land%C4%B1rma-dosyas%C4%B1n%C4%B1-d%C3%BCzenleme)

## TFRecord'ların Oluşturulma Sırası

- **Resim** verileri toplanır veya çekilir.
- Toplanan resimler `labelimg` yardımıyla etiketlenir ve `.xml` uzantılı dosyaları oluşturulur.
- `images` dizinine **resimler** ve onlara ait **xml** dosyaları **%80'i train %20'i eval** olacak şekilde klasörlere ayrılarak yerleştirilir.
- `scripts/preprocessing` dizindeki `xml_path_regulator.py` scripti aracılığıyla xml ve resimlerde yol sorunları düzeltilir, veriler yeniden adlandırılır.
- `scripts/preprocessing` dizindeki `xml_to_csv.py` scripti aracılığıyla veriler `.csv` uzantılı tablosal bir dosyaya dönüştürülür.
- Oluşturulan **csv** dosyasında resimlerin etiketlerine göre sayıları [tablo](#Excel%20ile%20Tablo%20G%C3%B6sterimi) olarak gösterilir. (Excel yardımıyla)
- Verilerde denge durumunun (her veriden yaklaşık olarak aynı sayıda varsa) kontrolü yapılır.
- Her çeşit veri için bir `id` belirtilecek şekilde `label_map.pbtxt` adlı etiket haritası oluşturulur
- Oluşturulan **csv**, **etiket haritası** ve **resim** verileri `scripts/preprocessing` dizindeki `generate_tfrecord.py` scripti aracılığıyla veriler `.record` uzantılı kayıtlara dönüştürülür.
- Seçilen modele özgü yapılandırma dosyası indirilir.
- Yapılandırma dosyası olan `*.config` dosyasındaki `PATH_TO_CONFIGURED` olarak işaretlenen alanlar, `num_classes`, `num_examples` ve `batch_size` değerleri güncellenir.
  - `num_examples` eval dizindeki resim sayısıdır (toplam class sayısı değil)

## Resim Etiketleme İşlemi

Etiketleme işlemini **labelImg** üzerinden yapmaktayız.

- İndirdiğiniz dizindeki `labelimg.exe` dosyasını çalıştırmanız yeterlidir.
- Pyton ile labelimg kullanmak için alttaki scripti kullanabilirsin
  
```sh
conda activate labelImg
cd %TENSORFLOW%\addons\labelImg
python labelImg.py ..\..\workspace\example_detection\images # çıktıları hedefleme
```

> LabelImg kullanımı için [bu videoya](https://www.youtube.com/watch?v=K_mFnvzyLvc&feature=youtu.be&t=9m13s) bakabilirsin.

### LabelImg Kısayolları

<kbd></kbd>
| Kısayol                | Açıklama         |
| ---------------------- | ---------------- |
| <kbd>D</kbd>           | ileri            |
| <kbd>A</kbd>           | gei              |
| <kbd>W</kbd>           | etiket           |
| <kbd>SPACE</kbd>       | ?                |
| <kbd>Yön Tuşları</kbd> | etiketi kaydırma |

## XML Düzenleme veya Hata Düzeltme Scriptleri

### Verileri Yeniden Adlandırma ve XML Hatalarını Düzeltme

LabelImg ile etiketlediğiniz resimleri farklı bir dizine taşımanız durumunda XML dosyalarındaki yollar uyuşmayacaktır. XML dosya yollarını düzeltmek, etiketsiz resimleri görüntülemek için [buradaki](scripts\preprocessing\xml_path_regulator.py) script dosyamı alttaki komutlar ile kullanabilirsiniz.

```sh
python scripts\preprocessing\xml_path_regulator.py -i %TENSORFLOW%\workspace\example_detection\images\train  -p train

python scripts\preprocessing\xml_path_regulator.py -i %TENSORFLOW%\workspace\example_detection\images\eval  -p eval
```

### Resimlerdeki Hataları Bulma

Resimlerde hata olduğu zaman eğitim aşamasında tensorflow modeli çalışma hatası vermektedir. Resimleri kontrol etmek için [buradaki](scripts\preprocessing\check_images.py) scripti alttaki komutlarla kullanabilirsiniz.

```bat
python scripts\preprocessing\check_images.py -i workspace\example_detection\images\train

python scripts\preprocessing\check_images.py -i workspace\example_detection\images\eval
```

### Etiketlenmemiş Resimleri Bulma

Etiketlenmemiş resimleri [buradaki](scripts\preprocessing\find_unlabeled_imgs.py) script dosyası ile alttaki komutlar ile kullanabilirsiniz.

> Eğer XML scriptini kullandıysanız bu kontrolü yapmanıza **gerek yoktur**, XML scripti bunu zaten yapmaktadır.

```bat
python scripts\preprocessing\find_unlabeled_imgs.py -i %TENSORFLOW%\workspace\example_detection\images\train

python scripts\preprocessing\find_unlabeled_imgs.py -i %TENSORFLOW%\workspace\example_detection\images\eval
```

## CVS Dosyalarını Oluşturma (XML -> CSV)

XML dosyalarını CSV dosyasında toparlamak için [buradaki](scripts\preprocessing\xml_to_csv.py) scripti alttaki komutlar ile kullanabilirsin.

> Komutları **Anaconda Prompt** üzerinden **tensorflow** ortamını aktif ederek uygulamayı unutmayın.

```sh
# Create train data:
python scripts\preprocessing\xml_to_csv.py -i %TENSORFLOW%\workspace\example_detection\images\train -o %TENSORFLOW%\workspace\example_detection\images\train_labels.csv

# Create eval data:
python scripts\preprocessing\xml_to_csv.py -i %TENSORFLOW%\workspace\example_detection\images\eval -o %TENSORFLOW%\workspace\example_detection\images\test_labels.csv
```

## CSV'lerden Resim Bilgilerini Analiz Etme

Her bir etiketten kaç tane olduğunu anlamak için csv dosyalarını açıp alltaki yöntemi uygulayın.

- `class` hücresiinin bir altındaki hücreyi seçin
- `ctrl` + `shift` + `aşağı ok` ile tüm sınıf verilerini seçin
- Sağ alttaki butona tıklayın
- `Tables` sekmesine gelin
- Açılan sekmede `Pivot Table` butonuna tıklayın
- Tablo'dan etiketlenen verileri kontrol edin
- Fazladan etiketlenmiş verilerin ismini bulup, filename, width vs. verilerin yazıldığı alanda `CTRL` + `F` komutu ile aratıp, uygun dosya ismini ve `xml` dosyasını silin

![csv](res/csv_table1.jpeg)
![csv](res/csv_table2.jpeg)
![csv](res/csv_table3.jpeg)
![csv](res/csv_table4.jpeg)

## Etiket Haritası (labelmap.pbtxt) Oluşturma

- Alttaki komutla açılan dizinde `.pbtxt` uzantılı etiket haritası dosyasısı oluşturun
- Örnek dosya yapısı komutların altındadır.

```sh
cd %TENSORFLOW%\workspace\example_detection\annotations
start .
```

```js
item {
  id: 1
  name: 'cat'
}
item {
  id: 2
  name: 'dog'
}
```

- `cat` ve `dog` etiket isimleridir

## TFRecord Oluşturma (CSV & labelmap -> TFRecord)

CSV dosyalarını TF kayıtlarına çevirmek için [buradaki](scripts\preprocessing\generate_tfrecord.py) scripti alttaki komutlar ile kullanabilirsin.

> Komutları **Anaconda Prompt** üzerinden **tensorflow** ortamını aktif ederek uygulamayı unutmayın.

```bat
python generate_tfrecord.py --label_map=%TENSORFLOW%\workspace\example_detection\data\label_map.pbtxt --csv_input=%TENSORFLOW%\workspace\example_detection\images\train_labels.csv --img_path=%TENSORFLOW%\workspace\example_detection\images\train --output_path=%TENSORFLOW%\workspace\example_detection\data\train.record

python generate_tfrecord.py --label_map=%TENSORFLOW%\workspace\example_detection\data\label_map.pbtxt --csv_input=%TENSORFLOW%\workspace\example_detection\images\test_labels.csv --img_path=%TENSORFLOW%\workspace\example_detection\images\eval --output_path=%TENSORFLOW%\workspace\example_detection\data\eval.record
```

## Bağlantıları (pipeline) Yapılandırma

- Tensorflow'un resmi açıklaması için [buraya](https://github.com/tensorflow/models/blob/master/research/object_detection/g3doc/configuring_jobs.md) tıklayabilirisin

### Modellin İndirilmesi ve Gerekli Yere Taşınması

- Tensorflow önceden eğitilmiş modelleri indirmek için [buraya](https://github.com/tensorflow/models/blob/master/research/object_detection/g3doc/detection_model_zoo.md#coco-trained-models-coco-models) tıklayabilrisin
- `.tar.gz` uzantılı olacağı için [winrar](https://www.win-rar.com/download.html?&L=0) ya da [7zip](https://www.7-zip.org/download.html) gibi ek uygulamalarla `buraya çıkart` demen gerekmekte
  - `Klasör'e çıkart` değil `buraya çıkart` diyeceksiniz.

> Klasör içinde aynı isimde başka klasör olmasın

```sh
# Modelin çıkartıldığı dizinde
cd <model_ismi>
move * %TENSORFLOW%\workspace\example_detection\pre_trained_model
move saved_model %TENSORFLOW%\workspace\example_detection\pre_trained_model
cd %TENSORFLOW%\workspace\example_detection\pre_trained_model
```

- `<model_ismi>` Seçip, indirdiğiniz `.tar.gz` uzantılı dosyanın adı
  - `TAB` tuşu ile dizindeki dosya adlarını tamamlayabilirsiniz
  - `*.tar.gz` uzantısı yazılmayacak
  - *Örn: ssd_inception_v2_coco_2018_01_28*
  - *Örn: ssd_mobilenet_v1_ppn_shared_box_predictor_300x300_coco14_sync_2018_07_03*

### Modellin Yapılandırma Dosyaları

Seçtiğiniz modelin `*.config` dosyasını `example_detection/training` klasörü altına kopyalamanız gerekmekte.

```sh
mkdir %TENSORFLOW%\workspace\example_detection\training

copy %TENSORFLOW%\models\research\object_detection\samples\configs\<model_ismi>.config %TENSORFLOW%\workspace\example_detection\training
```

- `<model_ismi>` Seçip, indirdiğiniz `.tar.gz` uzantılı dosyanın adı
  - `TAB` tuşu ile dizindeki dosya adlarını tamamlayabilirsiniz
  - `*.tar.gz` uzantısı yazılmayacak
  - Tarih son ekini içermemeli
    - `*_2018_07_03.tar.gz` ise `*.tar.gz` olarak yazılmalı
  - *Örn: ssd_inception_v2*
  - *Örn: ssd_mobilenet_v1_ppn_shared_box_predictor_300x300_coco14_sync*

### Modelin Yapılandırma Dosyasını Düzenleme

Yapılandırma örnek dosyası için [buraya](workspace\traffic_light_detector\training\ssd_mobilenet_v2_coco.config) bakabilirsin.

| Düzenlenecek Satır     | Açıklama               | Örnek                              |
| ---------------------- | ---------------------- | ---------------------------------- |
| `num_classes`          | Etiket türü sayısı     | `2`                                |
| `batch_size`           | Toplu işleme boyutu    | `24`                               |
| `num_steps`            | Adım sayısı            | `2000`                             |
| `fine_tune_checkpoint` | Eğitilmiş modelin yolu | `"./pre_trained_model/model.ckpt"` |
| `label_map_path`       | Etiket haritası yolu   | `"./annotations/train.record"`     |
| `input_path`           | Train dosyası yolu     | `"./annotations/train.record"`     |
| `input_path`           | Test dosyası yolu      | `"./annotations/eval.record"`      |

> [Model yapılandırma augmentation değişkenleri](https://stackoverflow.com/a/46901051/9770490)
