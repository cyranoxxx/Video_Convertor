# Video Ses Çevirici - Türkçe

Bu program, video dosyalarınızın seslerini otomatik olarak Türkçe'ye çevirir.

## Özellikler

- 🎥 Video dosyasından sesi çıkarır
- 🎤 Sesi metne dönüştürür (Speech-to-Text)
- 🌍 Metni Türkçe'ye çevirir
- 🔊 Türkçe metni sese dönüştürür (Text-to-Speech)
- 🎬 Yeni sesi video ile birleştirir

## Desteklenen Video Formatları

- MP4
- AVI
- MOV
- MKV
- FLV
- WMV
- WEBM

## Kurulum

### 1. FFmpeg'i yükleyin (Gerekli!)

**Yöntem 1: Otomatik Kurulum (Önerilen - Kolay)**

`ffmpeg_kur.bat` dosyasını çift tıklayın. Bu dosya:
- FFmpeg'i otomatik olarak indirir
- Doğru konuma kurar
- PATH'e otomatik ekler

**Yöntem 2: Manuel Kurulum**

1. [FFmpeg İndir](https://www.gyan.dev/ffmpeg/builds/)
2. `ffmpeg-release-essentials.zip` dosyasını indirin
3. Zip dosyasını `C:\ffmpeg` konumuna açın
4. `C:\ffmpeg\bin` klasörünü Windows PATH'e ekleyin:
   - Windows Ayarlar → Sistem → Hakkında → Gelişmiş sistem ayarları
   - Çevre Değişkenleri → User variables → Path → Düzenle
   - Yeni → `C:\ffmpeg\bin` ekleyin
   - Tamam'a basın

**Kurulumu test edin:**
Yeni bir PowerShell penceresi açın ve şunu yazın:
```bash
ffmpeg -version
```

Eğer FFmpeg versiyonu görünüyorsa, kurulum başarılı! ✓

### 2. Python paketlerini yükleyin

**Önemli:** Eski googletrans paketini kaldırıp yeni paketleri yükleyin:

```bash
pip uninstall -y googletrans
pip install --upgrade -r requirements.txt
```

Bu komut:
- Eski ve sorunlu `googletrans` paketini kaldırır
- Daha stabil `deep-translator` paketini yükler
- Tüm paket uyumsuzluklarını çözer

**Not:** İlk çalıştırmada Whisper modeli otomatik olarak indirilecektir (~140MB).

## Kullanım

### Mevcut klasördeki tüm videoları çevir:

```bash
python video_translator.py
```

### Belirli bir klasördeki videoları çevir:

```bash
python video_translator.py "C:\Videolarım"
```

## Çıktı

- İşlenmiş videolar **`output`** klasörüne kaydedilir
- Geçici dosyalar **`temp`** klasörüne kaydedilir (otomatik temizlenir)
- Orijinal dosyalar **`input`** klasöründe değiştirilmez

## Örnek Kullanım

1. Video dosyalarınızı **`input`** klasörüne kopyalayın
2. Terminalde şu komutu çalıştırın:
   ```bash
   python video_translator.py
   ```
3. Program işlemi tamamladığında, çevrilmiş videolar **`output`** klasöründe olacak

## Notlar

- İşlem video uzunluğuna göre biraz zaman alabilir
- İnternet bağlantısı gereklidir (çeviri ve TTS için)
- Whisper modeli ilk çalıştırmada indirilir (~140MB)
- Ses kalitesi ve çeviri doğruluğu, orijinal ses kalitesine bağlıdır

## Sorun Giderme

### "FFmpeg bulunamadı" hatası:
- FFmpeg'in kurulu olduğundan ve PATH'e eklendiğinden emin olun
- Terminali kapatıp yeniden açın

### "Model indirme hatası":
- İnternet bağlantınızı kontrol edin
- Firewall ayarlarınızı kontrol edin

### "Çeviri hatası":
- İnternet bağlantınızı kontrol edin
- Daha sonra tekrar deneyin (Google Translate API limiti)

## Lisans

MIT License
