# Yapılacaklar <!-- omit in toc -->

## İçerikler <!-- omit in toc -->

- [Tam Otomatikleştirme](#tam-otomatikle%C5%9Ftirme)
- [Eski Yapılacaklar](#eski-yap%C4%B1lacaklar)
  - [Sonra Yapılacaklar](#sonra-yap%C4%B1lacaklar)
  - [Sonradan Eklenecek Scriptleştirme](#sonradan-eklenecek-scriptle%C5%9Ftirme)
  - [Sonradan Derlenecek Bilgiler](#sonradan-derlenecek-bilgiler)
    - [TF Verilerini Alma](#tf-verilerini-alma)
      - [Recover the images from the TFRecord file](#recover-the-images-from-the-tfrecord-file)
- [Lisans ve Teferruatlar](#lisans-ve-teferruatlar)

## Tam Otomatikleştirme

- [ ] CSV dosyası, XML dosyası ve resimlerden
- [ ] `num_classes` CSV dosyasından
- [ ] `labelmap.pbtxr` CSV dosyasından
- [ ] `num_examples` Eval resmi sayısından
- [ ] `batch_size` Resim sayısına göre hesaplanacak

## Eski Yapılacaklar

- [ ] **Tensorflow notları buraya taşınacak!**
- [ ] Her yeni eğitim için yapılacaklar için hızlı notlar oluştur
  - [ ] Num classses'lar değişecek (config ve detection_utils)
  - [ ] Yollar değişecek (config ve detection_utils)
  - [ ] Label_map.pbtxt değişecek
  - [ ] Test sayısı config'e girilecek
- [ ] Git sorununu düzelt, temiz çıktıya geç
  - [ ] Gitignore'a gereksiz herşeyi ekle (*, ** gibi karakterler ile)
  - [ ] Models klasörünü ele alma, dışarıdan indirme linkini ver
- [ ] VsCode için modül bulunamadı sorunu düzeltilecek
  - [ ] PythonPath ile ortam değişkeni ayarlamaya çalışılacak
  - [ ] VsCode, python proje çalıştırıcısı olarak ele alınacak

### Sonra Yapılacaklar

- [ ] TF recordları oluşturma kısmı otomatikleştirelecek ve dizinler bağımlı yollar halinde belirtilecek
  - [ ] `.csv` deki class'lardan label_map oluşturulacak.
  - [ ] `generate.tfrecord.py` içerisinde tüm diğer scriptler eklenecek ve `FROM: ?` ile xml veya csv bilgisi alacak
  - [ ] Benim yapıma uygun yapıya sahip olanların CLI parametresi vermesine gerek olmayacak
- [ ] El ile yapılan tüm işlemler otomatize edilecek
  - [ ] `images` içindeki eval, train adlı dizinlerin ismi otomatik alınacak
  - [ ] `grap_images.py` script'i olacak ve resimleri gerekli dizinlere yerleştirmek için yol alacak (yerleştirileceklerin yolu)
  - [ ] Etiketli veriler hazır olduğunda tek bir script `generate_tf_data` ile  direk eğitime hazır hale getirilecek
    - [ ] label_map csv'den alınacak
    - [ ] config yolu otomatik tanımlanacak
    - [ ] recordlar xml'den oluşturulacak
- [ ] `pre_trained_model` klasörü yeniden adlandırılacak ve modeller için alt klasörler olacak
  - [ ] `base_model` ile modelin sıfır hali tutulacak
- [ ] `inference_graph` klasörü yeniden adlandırılacak ve modeller için alt klasörler olacak
- [ ] Tf recordları farklı yöntemlerle elde etmeyi araştır
- [ ] TF recoderlardan resimleri elde etmeyi araştır

### Sonradan Eklenecek Scriptleştirme

- [ ] Linux için sh script
  - [ ] Protobuf, tensorflow vs. her biri için
- [ ] Windows için bat executable

### Sonradan Derlenecek Bilgiler

- [ ] Yaptığım tekninleri video'ya veya yazıya kayıt edeceğim
  - [ ] csv'lerden alanı seçip tablo formatına alarak class sayılarını görme vs.

<div class="page"/>

#### TF Verilerini Alma

<https://www.tensorflow.org/tutorials/load_data/tf_records>

##### Recover the images from the TFRecord file

```py
for image_features in parsed_image_dataset:
  image_raw = image_features['image_raw'].numpy()
  display.display(display.Image(data=image_raw))
```

## Lisans ve Teferruatlar

Bu yazı **MIT** lisanslıdır. Lisanslar hakkında bilgi almak için [buraya](https://choosealicense.com/licenses/) bakmanda fayda var.

- [Github](https://github.com/yedhrab)
- [Website](https://yemreak.com)
- [LinkedIn](https://www.linkedin.com/in/yemreak/)

> Yardım veya destek için [iletişime](mailto::yedhrab@gmail.com?subject=YTensorflow%20%7C%20Github) geçebilrsiniz 🤗

~ Yunus Emre Ak

[İÜ-CE Ders Notları]: https://github.com/yedhrab/IU-CE-DersNotlari
