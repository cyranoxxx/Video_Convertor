# 🚀 HIZLI BAŞLANGIÇ KILAVUZU

## Adım Adım Kurulum

### 1️⃣ FFmpeg Kurulumu
Çift tıkla: **`ffmpeg_kur.bat`**
- Program otomatik olarak FFmpeg'i indirecek ve kuracak
- Bu 2-3 dakika sürebilir
- İşlem bitince pencereyi kapat

### 2️⃣ Python Paketleri Kurulumu
Çift tıkla: **`kurulum.bat`**
- Gerekli Python paketlerini yükleyecek
- Bu 5-10 dakika sürebilir
- İşlem bitince pencereyi kapat

### 3️⃣ Videoları Çevir
1. Video dosyalarınızı **`input`** klasörüne kopyalayın
2. Çift tıkla: **`calistir.bat`**
3. Program videoları işleyecek
4. İşlenmiş videolar **`output`** klasöründe olacak!

---

## 🎬 Kullanım

### Desteklenen Formatlar:
- MP4, AVI, MOV, MKV, FLV, WMV, WEBM

### Program Ne Yapar?
1. ✅ Video sesini çıkarır
2. ✅ Sesi metne dönüştürür
3. ✅ Metni Türkçe'ye çevirir
4. ✅ Türkçe metni sese dönüştürür
5. ✅ Yeni sesi video ile birleştirir

### Önemli Notlar:
- ⚠️ İnternet bağlantısı gerekli (çeviri için)
- ⏱️ İşlem süresi video uzunluğuna bağlı
- 📁 Orijinal videolar değişmez
- 📂 Çıktılar `output` klasöründedir

---

## ❓ Sorun mu Yaşıyorsunuz?

### "FFmpeg bulunamadı" hatası:
1. `ffmpeg_kur.bat` dosyasını çalıştırın
2. Tüm terminal pencerelerini kapatın
3. YENİ bir PowerShell açın
4. `ffmpeg -version` yazın (test için)
5. Tekrar deneyin

### "Paket kurulum hatası":
1. PowerShell'i **Yönetici olarak** açın
2. `cd c:\Video_Converter` yazın
3. `pip install --upgrade pip` yazın
4. `kurulum.bat` dosyasını tekrar çalıştırın

### "İnternet bağlantı hatası":
- VPN kullanıyorsanız kapatın
- Firewall ayarlarını kontrol edin
- Proxy kullanıyorsanız ayarları yapın

---

## 📞 Yardım

Daha fazla bilgi için **`README.md`** dosyasına bakın.

İyi kullanımlar! 🎉
