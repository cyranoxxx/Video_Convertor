# 🎬 Video Converter - Otomatik Video Ses Çevirici

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

## 📹 Desteklenen Formatlar

MP4, AVI, MOV, MKV, FLV, WMV, WEBM, TS

## 🚀 Hızlı Başlangıç

### Otomatik Kurulum (Önerilen)

1. **Depoyu klonlayın**
   ```bash
   git clone https://github.com/KULLANICI_ADINIZ/video_converter.git
   cd video_converter
   ```

2. **İlk kurulum**
   ```bash
   01_ONCE_BU_DOSYAYI_CALISTIR.bat
   ```

3. **Videoları ekleyin**
   - Video dosyalarınızı `input/` klasörüne kopyalayın

4. **Çeviriyi başlatın**
   ```bash
   calistir.bat
   ```

5. **Sonuçları alın**
   - İşlenmiş videolar `output/` klasöründe!

### Manuel Kurulum

Detaylı kurulum talimatları için [README.md](README.md) dosyasına bakın.

## 📂 Klasör Yapısı

```
video_converter/
├── input/                  # Yabancı dildeki videoları buraya koyun
├── output/                 # İşlenmiş videolar buradan çıkar
├── temp/                   # Geçici dosyalar (otomatik temizlenir)
├── video_translator.py     # Ana program
├── requirements.txt        # Python bağımlılıkları
└── README.md              # Detaylı dokümantasyon
```

## 🔧 Gereksinimler

- Python 3.8 veya üstü
- FFmpeg
- İnternet bağlantısı (çeviri için)
- Windows (diğer platformlar için `video_translator.py` doğrudan çalıştırılabilir)

## 📖 Dokümantasyon

- [README.md](README.md) - Tam dokümantasyon
- [BASLANGIC.md](BASLANGIC.md) - Hızlı başlangıç kılavuzu
- [ONEMLI_OKUYUN.txt](ONEMLI_OKUYUN.txt) - Özet bilgi

## 🤝 Katkıda Bulunma

1. Bu depoyu fork edin
2. Yeni bir branch oluşturun (`git checkout -b feature/yeniOzellik`)
3. Değişikliklerinizi commit edin (`git commit -am 'Yeni özellik eklendi'`)
4. Branch'inizi push edin (`git push origin feature/yeniOzellik`)
5. Pull Request oluşturun

## 📝 Lisans

Bu proje [MIT Lisansı](LICENSE) altında lisanslanmıştır.

## 🙏 Teşekkürler

- [OpenAI Whisper](https://github.com/openai/whisper) - Ses tanıma
- [deep-translator](https://github.com/nidhaloff/deep-translator) - Çeviri
- [gTTS](https://github.com/pndurette/gTTS) - Ses sentezi
- [MoviePy](https://github.com/Zulko/moviepy) - Video işleme

## ⚠️ Sorun Giderme

Sorun yaşıyorsanız [Issues](https://github.com/KULLANICI_ADINIZ/video_converter/issues) sayfasına bakın veya yeni bir issue açın.

## 📧 İletişim

Sorularınız için issue açabilir veya pull request gönderebilirsiniz.

---

⭐ Projeyi beğendiyseniz yıldız vermeyi unutmayın!
