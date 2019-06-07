# Google Colab Üzerinden Tensorflow Modeli Eğitme <!-- omit in toc -->

## İçerikler <!-- omit in toc -->

- [Temel Bilgiler](#temel-bilgiler)
- [Colab Eğitimi için Gereksinimler](#colab-e%C4%9Fitimi-i%C3%A7in-gereksinimler)
  - [Ekran Kartını Aktif Etme](#ekran-kart%C4%B1n%C4%B1-aktif-etme)
  - [Eğitim için Gerekli Dosyalar](#e%C4%9Fitim-i%C3%A7in-gerekli-dosyalar)
  - [Eğitim için İsteğe Bağlı Dosyalar](#e%C4%9Fitim-i%C3%A7in-i%CC%87ste%C4%9Fe-ba%C4%9Fl%C4%B1-dosyalar)
- [Colab Üzeriinden Eğitim Kodları](#colab-%C3%BCzeriinden-e%C4%9Fitim-kodlar%C4%B1)

## Temel Bilgiler

- Google colabratory, ücretsiz **IPython** destekli sunucu sunan Google hizmetidir
- Ücretsiz sunucu üzerinden ekran kartını da kullanarak model eğitimi yapılabilmekte
- Google Colabratory'e [buradan][Google Colabratory] erişebilirsin
- GPU’yu multiple kullanıcılara bölüştürüyor. Şanslı bazı kullanıcılar %100 share elde ediyor; ama çoğunluğa %5 veriyor.

> Google hesabı gerektirir.

## Colab Eğitimi için Gereksinimler

Colab üzerindeki çalışma dizini

- Tensorflow çalışma dizinimizdeki `workspace/example_detection`
- Tensorflow models
- `scripts`

kısımlarından oluşur.

### Ekran Kartını Aktif Etme

- `Runtime`
- `Change runtime types`
- `GPU`

> İstersen `Omit code cell output when saving this notebook` ile çıktıları gizleyebilirsin.

### Eğitim için Gerekli Dosyalar

| Gereksinim        | Açıklama             |
| ----------------- | -------------------- |
| `label_map.pbtxt` | Etiket haritası      |
| `eval.record`     | TF Kayıtları         |
| `train.record`    | TF Kayıtları         |
| `*.config`        | Model yapılandırması |

### Eğitim için İsteğe Bağlı Dosyalar

| Gereksinim                  | Açıklama                 |
| --------------------------- | ------------------------ |
| `model_main.py`             | Modeli eğitme (yeni)     |
| `train.py`                  | Modeli eğitme (eski)     |
| `export_inference_graph.py` | Modelin sonucunu çıkarma |

## Colab Üzeriinden Eğitim Kodları

Detayları öğrenmek için [buraya][Tensorlow Obje Algılayıcısını Colab Üzerinden Eğitme] tıklayarak colab notuma erişebilirsin.

[Google Colabratory]: https://colab.research.google.com/
[Tensorlow Obje Algılayıcısını Colab Üzerinden Eğitme]: https://colab.research.google.com/drive/1nseyw_dIhhesbXhRyC-qwnduNlLcU0N3#scrollTo=O0rYcGTFNnbP
