# Git'e Yükleme Rehberi

Bu dosya, projenizi GitHub'a yüklemeniz için adım adım talimatlar içerir.

## Adım 1: Git'i Başlat ve İlk Commit

PowerShell veya Terminal açın ve şu komutları çalıştırın:

```bash
cd c:\Video_Converter

# Git'i başlat
git init

# Tüm dosyaları ekle (input/output içerikleri hariç - .gitignore otomatik filtreleyecek)
git add .

# İlk commit
git commit -m "İlk commit: Video ses çevirici programı"
```

## Adım 2: GitHub'da Yeni Repo Oluştur

1. [GitHub](https://github.com) üzerinden giriş yapın
2. Sağ üst köşeden **"+"** işaretine tıklayın
3. **"New repository"** seçin
4. Repository ismi: **`video_converter`** (veya istediğiniz isim)
5. Description: **"Videoların sesini otomatik Türkçe'ye çeviren Python programı"**
6. **Public** veya **Private** seçin
7. **"Create repository"** butonuna tıklayın

## Adım 3: GitHub'a Bağlan ve Push Et

GitHub'da oluşturduğunuz repo sayfasında görünen komutları kullanın:

```bash
# Remote ekle (KULLANICI_ADINIZ yerine kendi GitHub kullanıcı adınızı yazın)
git remote add origin https://github.com/KULLANICI_ADINIZ/video_converter.git

# Ana branch adını main yap
git branch -M main

# GitHub'a push et
git push -u origin main
```

## Adım 4: README'yi Güncelle

1. GitHub'da reponuzu açın
2. `README_GITHUB.md` dosyasının içeriğini kopyalayın
3. Ana `README.md` olarak kaydedin
4. `README_GITHUB.md` dosyasında **KULLANICI_ADINIZ** yazan yerleri kendi kullanıcı adınızla değiştirin

## Ne Git'e Eklendi, Ne Eklenmedi?

### ✅ Git'e Eklenenler:
- `video_translator.py` - Ana program
- `requirements.txt` - Bağımlılıklar
- `*.bat` - Kurulum scriptleri
- `*.md` - Dokümantasyon
- `.gitignore` - Git kuralları
- `LICENSE` - Lisans dosyası
- `input/BURAYA_VIDEO_KOYUN.txt` - Sadece bilgi dosyası

### ❌ Git'e EKLENMEYENler (.gitignore tarafından filtrelendi):
- `input/*.mp4` - Video dosyaları
- `input/*.avi` - Video dosyaları (tüm formatlar)
- `output/*` - İşlenmiş videolar
- `temp/*` - Geçici dosyalar
- `__pycache__/` - Python cache
- `*.pyc` - Derlenmiş Python dosyaları
- Whisper model cache

## Sonraki Güncellemeler İçin:

Kodda değişiklik yaptıktan sonra:

```bash
# Değişiklikleri kontrol et
git status

# Değişiklikleri ekle
git add .

# Commit et
git commit -m "Açıklayıcı mesaj yazın"

# GitHub'a gönder
git push
```

## İpuçları:

- **Commit mesajları** açıklayıcı olmalı
- **Sık sık commit** yapın
- **Video dosyalarını** asla Git'e eklemeyin (otomatik filtreleniyor)
- **`.gitignore`** dosyasını silmeyin

## Yardım:

Sorun yaşarsanız:
```bash
# Git durumunu kontrol et
git status

# Remote kontrolü
git remote -v

# Son commitleri gör
git log --oneline
```

İyi kullanımlar! 🚀
