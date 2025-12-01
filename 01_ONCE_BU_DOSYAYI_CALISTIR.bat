@echo off
chcp 65001 >nul
color 0A
title Video Çevirici - Kurulum Sihirbazı

echo.
echo    ╔══════════════════════════════════════════════════════╗
echo    ║                                                      ║
echo    ║     VIDEO SES ÇEVİRİCİ - KURULUM SİHİRBAZI          ║
echo    ║                                                      ║
echo    ╚══════════════════════════════════════════════════════╝
echo.
echo.
echo    Bu kurulum sihirbazı size adım adım yardımcı olacak.
echo.
echo    ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo.
pause
cls

echo.
echo    ADIM 1/2: FFmpeg Kurulumu
echo    ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo.
echo    FFmpeg video işleme için gerekli bir araçtır.
echo.
where ffmpeg >nul 2>&1
if %ERRORLEVEL% EQU 0 (
    echo    ✓ FFmpeg zaten kurulu!
    echo.
    ffmpeg -version | findstr "ffmpeg version"
    echo.
    goto :step2
)

echo    ✗ FFmpeg kurulu değil!
echo.
echo    Şimdi ne yapmak istersiniz?
echo.
echo    [1] Otomatik kurulum (Önerilen)
echo    [2] Manuel kurulum talimatlarını göster
echo    [3] Daha sonra hallederim
echo.
choice /c 123 /n /m "    Seçiminiz (1, 2 veya 3): "

if errorlevel 3 goto :skip_ffmpeg
if errorlevel 2 goto :manual_ffmpeg
if errorlevel 1 goto :auto_ffmpeg

:auto_ffmpeg
cls
echo.
echo    Otomatik Kurulum Başlatılıyor...
echo    ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo.
call ffmpeg_kur.bat
echo.
echo    FFmpeg kuruldu! Şimdi bu pencereyi kapatıp
echo    YENİ bir PowerShell açarak tekrar bu dosyayı çalıştırın.
echo.
pause
exit

:manual_ffmpeg
cls
echo.
echo    Manuel Kurulum Talimatları
echo    ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo.
echo    1. Tarayıcınızda şu siteyi açın:
echo       https://www.gyan.dev/ffmpeg/builds/
echo.
echo    2. "ffmpeg-release-essentials.zip" dosyasını indirin
echo.
echo    3. Zip dosyasını açın ve içindeki "ffmpeg-xxx" klasöründeki
echo       "bin" klasörünü "C:\ffmpeg\bin" konumuna kopyalayın
echo.
echo    4. Windows Ayarlar → Sistem → Hakkında → Gelişmiş sistem ayarları
echo       → Çevre Değişkenleri → Path → Düzenle
echo       → Yeni → "C:\ffmpeg\bin" ekleyin
echo.
echo    5. Bilgisayarınızı yeniden başlatın
echo.
echo    6. Bu dosyayı tekrar çalıştırın
echo.
pause
exit

:skip_ffmpeg
echo.
echo    ⚠ FFmpeg olmadan program çalışmayacak!
echo    Daha sonra ffmpeg_kur.bat dosyasını çalıştırabilirsiniz.
echo.
pause

:step2
cls
echo.
echo    ADIM 2/2: Python Paketleri
echo    ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo.
echo    Gerekli Python paketleri yükleniyor...
echo    Bu işlem 5-10 dakika sürebilir.
echo.
pause

echo.
echo    [1/2] Eski paketler temizleniyor...
pip uninstall -y googletrans torch torchvision torchaudio transformers

echo.
echo    [2/2] Yeni paketler yükleniyor...
pip install --no-cache-dir -r requirements.txt

echo.
echo    ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo.
echo    ✓ KURULUM TAMAMLANDI!
echo.
echo    Şimdi videoları çevirmek için:
echo    1. Video dosyalarınızı bu klasöre kopyalayın
echo    2. "calistir.bat" dosyasını çift tıklayın
echo.
echo    İyi kullanımlar! 🎉
echo.
pause
