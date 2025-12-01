@echo off
chcp 65001 >nul
color 0B
title Video Çevirici - Çalışıyor

cls
echo.
echo    ╔══════════════════════════════════════════════════════╗
echo    ║                                                      ║
echo    ║         VIDEO SES ÇEVİRİCİ - TÜRKÇE                  ║
echo    ║                                                      ║
echo    ╚══════════════════════════════════════════════════════╝
echo.

REM FFmpeg kontrolü
where ffmpeg >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    color 0C
    echo    ╔══════════════════════════════════════════════════════╗
    echo    ║  ✗ HATA: FFmpeg bulunamadı!                          ║
    echo    ╚══════════════════════════════════════════════════════╝
    echo.
    echo    Lütfen önce "01_ONCE_BU_DOSYAYI_CALISTIR.bat" dosyasını
    echo    çalıştırarak kurulum yapın.
    echo.
    pause
    exit /b 1
)

echo    Video dosyalarınızı 'input' klasörüne koyup bu dosyayı çalıştırın.
echo.
echo    İşlenmiş videolar 'output' klasöründe olacak.
echo    ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo.
echo    Program başlatılıyor...
echo.

python video_translator.py

if %ERRORLEVEL% EQU 0 (
    color 0A
    echo.
    echo    ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    echo    ✓ Program başarıyla tamamlandı!
    echo.
    echo    İşlenmiş videolar 'output' klasöründedir.
) else (
    color 0C
    echo.
    echo    ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    echo    ✗ Program hata ile sonlandı!
    echo.
    echo    Lütfen yukarıdaki hata mesajlarını kontrol edin.
)

echo.
pause
