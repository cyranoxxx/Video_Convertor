@echo off
chcp 65001 >nul
echo ╔════════════════════════════════════════════════════════╗
echo ║   Video Ses Çevirici - Kurulum                         ║
echo ╚════════════════════════════════════════════════════════╝
echo.

echo [1/3] Eski paketler kaldırılıyor...
pip uninstall -y googletrans

echo.
echo [2/3] Yeni paketler yükleniyor...
pip install --upgrade -r requirements.txt

echo.
echo [3/3] FFmpeg kontrolü yapılıyor...
where ffmpeg >nul 2>&1
if %ERRORLEVEL% EQU 0 (
    echo ✓ FFmpeg kurulu!
    echo.
    echo ╔════════════════════════════════════════════════════════╗
    echo ║   Kurulum tamamlandı! ✓                                ║
    echo ╚════════════════════════════════════════════════════════╝
    echo.
    echo Kullanım:
    echo   python video_translator.py
    echo.
) else (
    echo ✗ FFmpeg bulunamadı!
    echo.
    echo FFmpeg'i otomatik kurmak için "ffmpeg_kur.bat" dosyasını çalıştırın.
    echo.
    echo Veya manuel kurulum için:
    echo   1. https://www.gyan.dev/ffmpeg/builds/ adresine gidin
    echo   2. ffmpeg-release-essentials.zip dosyasını indirin
    echo   3. README.md dosyasındaki talimatları takip edin
    echo.
)

pause
