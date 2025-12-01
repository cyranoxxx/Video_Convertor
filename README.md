# 🎬 Video Ses Çevirici - Türkçe

[![Python](https://img.shields.io/badge/Python-3.8%2B-blue.svg)](https://www.python.org/)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Platform](https://img.shields.io/badge/Platform-Windows-lightgrey.svg)](https://www.microsoft.com/windows)

Videoların sesini otomatik olarak Türkçe'ye çeviren akıllı Python uygulaması. Whisper AI ile ses tanıma, Google Translate ile çeviri ve Google TTS ile doğal Türkçe ses sentezi.

## ✨ Özellikler

- 🎤 **Ses Tanıma**: OpenAI Whisper ile yüksek kaliteli ses tanıma
- 🌍 **Otomatik Dil Algılama**: Herhangi bir dilden Türkçe'ye çeviri
- 🔊 **Doğal Ses Sentezi**: Google TTS ile Türkçe ses oluşturma
- 🎬 **Video Birleştirme**: Yeni sesi orijinal video ile otomatik birleştirme
- 📁 **Toplu İşlem**: Birden fazla videoyu tek seferde işleme
- 🚀 **Kolay Kurulum**: Otomatik kurulum scriptleri

## 📹 Desteklenen Video Formatları

MP4, AVI, MOV, MKV, FLV, WMV, WEBM, TS

---

## 🚀 Hızlı Başlangıç

### ⚠️ ÖNEMLİ NOT

Program **`Video_Convertor`** klasörünün içinde çalışır. Tüm işlemleri bu klasör içerisinden yapmalısınız.

### 📋 Adım 1: İlk Kurulum (Sadece Bir Kez)

1. **`Video_Convertor`** klasörüne gidin
2. **`01_ONCE_BU_DOSYAYI_CALISTIR.bat`** dosyasını çift tıklayın
   
   Bu dosya otomatik olarak:
   - ✅ FFmpeg'i indirecek ve kuracak
   - ✅ Gerekli Python paketlerini yükleyecek
   - ✅ Her şeyi hazır hale getirecek

   ⏱️ Kurulum 5-10 dakika sürebilir.

### 📥 Adım 2: Videoları Ekleme

1. Çevirmek istediğiniz videoları **`input`** klasörüne kopyalayın
2. Birden fazla video ekleyebilirsiniz (hepsi işlenecek)

**Desteklenen formatlar:** MP4, AVI, MOV, MKV, FLV, WMV, WEBM, TS

### ▶️ Adım 3: Çeviriyi Başlatma

1. **`calistir.bat`** dosyasını çift tıklayın
2. Program otomatik olarak:
   - ✅ `input` klasöründeki tüm videoları bulacak
   - ✅ Her videonun sesini çıkaracak
   - ✅ Sesi metne dönüştürecek
   - ✅ Metni Türkçe'ye çevirecek
   - ✅ Türkçe metni sese dönüştürecek
   - ✅ Yeni sesi videoya ekleyecek
   - ✅ İşlenmiş videoları **`output`** klasörüne kaydedecek

### ✅ Adım 4: Sonuçları Alma

İşlem tamamlandığında:
- İşlenmiş videolar **`output`** klasöründe olacak
- Dosya adları: `orijinal_isim_turkish.mp4`
- Orijinal videolar **`input`** klasöründe değişmeden kalacak

---

## 📂 Klasör Yapısı

```
Video_Convertor/
│
├── input/                           ← 🎬 Yabancı dildeki videoları BURAYA koyun
│   ├── video1.mp4
│   ├── video2.avi
│   └── BURAYA_VIDEO_KOYUN.txt
│
├── output/                          ← ✅ İşlenmiş videolar BURADAN çıkar
│   ├── video1_turkish.mp4
│   └── video2_turkish.avi
│
├── temp/                            ← 🔧 Geçici dosyalar (otomatik temizlenir)
│
├── 01_ONCE_BU_DOSYAYI_CALISTIR.bat  ← 1️⃣ İlk kurulum
├── calistir.bat                     ← 2️⃣ Videoları çevir
├── video_translator.py              ← Ana program
├── requirements.txt                 ← Python bağımlılıkları
└── README.md                        ← Bu dosya
```

---

## 🔧 Sistem Gereksinimleri

- **İşletim Sistemi**: Windows 10 veya üstü
- **Python**: 3.8 veya üstü
- **İnternet**: Gerekli (çeviri ve model indirme için)
- **Disk Alanı**: En az 2 GB (Whisper modeli için)

---

## 💡 Örnek Kullanım

```
1. Video_Convertor klasörüne git
2. İlk kez kullanıyorsan → 01_ONCE_BU_DOSYAYI_CALISTIR.bat
3. video1.mp4 ve video2.avi dosyalarını input/ klasörüne kopyala
4. calistir.bat dosyasını çalıştır
5. İşlem bitince output/ klasöründen al:
   - video1_turkish.mp4
   - video2_turkish.avi
```

---

## 🌍 Desteklenen Diller

**Kaynak Diller** (Otomatik algılama):
- İngilizce, Almanca, Fransızca, İspanyolca, İtalyanca
- Rusça, Japonca, Çince, Korece, Arapça
- Ve 90+ dil daha!

**Hedef Dil**:
- 🇹🇷 Türkçe (sabit)

---

## ⚙️ Program Nasıl Çalışır?

1. **Ses Çıkarma**: Video dosyasından ses çıkarılır
2. **Ses Tanıma**: OpenAI Whisper ile ses metne dönüştürülür
3. **Çeviri**: Google Translate ile metin Türkçe'ye çevrilir
4. **Ses Sentezi**: Google TTS ile Türkçe metin sese dönüştürülür
5. **Birleştirme**: Yeni Türkçe ses orijinal video ile birleştirilir

---

## 📖 Detaylı Dokümantasyon

- **Hızlı Başlangıç**: [BASLANGIC.md](BASLANGIC.md)
- **Sorun Giderme**: [ONEMLI_OKUYUN.txt](ONEMLI_OKUYUN.txt)
- **Git Yükleme**: [GIT_YUKLEME_REHBERI.md](GIT_YUKLEME_REHBERI.md)

---

## ❓ Sık Sorulan Sorular

**S: Video kalitesi düşüyor mu?**  
C: Hayır, orijinal video kalitesi korunur. Sadece ses değiştirilir.

**S: İşlem ne kadar sürer?**  
C: Video uzunluğuna bağlı. 10 dakikalık bir video yaklaşık 3-5 dakika sürebilir.

**S: İnternet bağlantısı şart mı?**  
C: Evet, çeviri ve ilk kurulum için internet gerekli.

**S: Hangi dilleri destekliyor?**  
C: Herhangi bir dilden Türkçe'ye çeviri yapar.

---

## 🐛 Sorun Giderme

### "FFmpeg bulunamadı" hatası:
```bash
# Çözüm: ffmpeg_kur.bat çalıştır veya terminali kapat ve yeni terminal aç
```

### "Module not found" hatası:
```bash
pip install --no-cache-dir -r requirements.txt
```

---

## 📝 Lisans

Bu proje [MIT Lisansı](LICENSE) altında lisanslanmıştır.

---

## 🙏 Teşekkürler

- [OpenAI Whisper](https://github.com/openai/whisper) - Ses tanıma
- [deep-translator](https://github.com/nidhaloff/deep-translator) - Çeviri
- [gTTS](https://github.com/pndurette/gTTS) - Ses sentezi
- [MoviePy](https://github.com/Zulko/moviepy) - Video işleme

---

## 📧 İletişim & Destek

- **Issues**: [GitHub Issues](https://github.com/cyranoxxx/Video_Convertor/issues)
- **Repository**: [Video_Convertor](https://github.com/cyranoxxx/Video_Convertor)

---

⭐ Projeyi beğendiyseniz yıldız vermeyi unutmayın!

**İyi kullanımlar!** 🎉
