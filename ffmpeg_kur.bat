@echo off
chcp 65001 >nul
echo ╔════════════════════════════════════════════════════════╗
echo ║   FFmpeg Otomatik Kurulum                              ║
echo ╚════════════════════════════════════════════════════════╝
echo.

echo FFmpeg kontrol ediliyor...
where ffmpeg >nul 2>&1
if %ERRORLEVEL% EQU 0 (
    echo ✓ FFmpeg zaten kurulu!
    echo.
    ffmpeg -version | findstr "ffmpeg version"
    echo.
    pause
    exit /b 0
)

echo FFmpeg bulunamadı. Otomatik kurulum başlatılıyor...
echo.

REM FFmpeg indirme klasörü
set INSTALL_DIR=%USERPROFILE%\ffmpeg
set DOWNLOAD_URL=https://www.gyan.dev/ffmpeg/builds/ffmpeg-release-essentials.zip
set ZIP_FILE=%TEMP%\ffmpeg.zip

echo [1/5] İndirme başlıyor...
echo Kaynak: %DOWNLOAD_URL%
echo.

powershell -Command "& {[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -Uri '%DOWNLOAD_URL%' -OutFile '%ZIP_FILE%' -UserAgent 'Mozilla/5.0'}"

if not exist "%ZIP_FILE%" (
    echo ✗ İndirme başarısız!
    echo.
    echo Manuel kurulum için:
    echo 1. Tarayıcınızda şu siteyi açın: https://www.gyan.dev/ffmpeg/builds/
    echo 2. "ffmpeg-release-essentials.zip" dosyasını indirin
    echo 3. Zip dosyasını açın
    echo 4. "bin" klasörünü "C:\ffmpeg\bin" konumuna kopyalayın
    echo 5. System PATH'e "C:\ffmpeg\bin" ekleyin
    echo.
    pause
    exit /b 1
)

echo ✓ İndirildi!
echo.

echo [2/5] Zip dosyası açılıyor...
if exist "%INSTALL_DIR%" (
    rmdir /s /q "%INSTALL_DIR%"
)
mkdir "%INSTALL_DIR%"

powershell -Command "& {Expand-Archive -Path '%ZIP_FILE%' -DestinationPath '%INSTALL_DIR%' -Force}"

if %ERRORLEVEL% NEQ 0 (
    echo ✗ Açma başarısız!
    pause
    exit /b 1
)

echo ✓ Açıldı!
echo.

echo [3/5] Dosyalar düzenleniyor...
for /d %%i in ("%INSTALL_DIR%\ffmpeg-*") do (
    xcopy "%%i\bin" "%INSTALL_DIR%\bin\" /E /I /Y >nul
    xcopy "%%i\doc" "%INSTALL_DIR%\doc\" /E /I /Y >nul
    rmdir /s /q "%%i"
)

echo ✓ Düzenlendi!
echo.

echo [4/5] PATH'e ekleniyor...
set FFMPEG_BIN=%INSTALL_DIR%\bin

REM Kullanıcı PATH'ine ekle
for /f "skip=2 tokens=3*" %%a in ('reg query HKCU\Environment /v PATH 2^>nul') do set "USER_PATH=%%a %%b"
if not defined USER_PATH set "USER_PATH="

echo %USER_PATH% | find /i "%FFMPEG_BIN%" >nul
if %ERRORLEVEL% NEQ 0 (
    setx PATH "%USER_PATH%;%FFMPEG_BIN%"
    echo ✓ PATH'e eklendi!
) else (
    echo ✓ PATH'de zaten var!
)

echo.

echo [5/5] Temizlik yapılıyor...
del "%ZIP_FILE%" >nul 2>&1
echo ✓ Tamamlandı!
echo.

echo ╔════════════════════════════════════════════════════════╗
echo ║   FFmpeg başarıyla kuruldu! ✓                          ║
echo ╚════════════════════════════════════════════════════════╝
echo.
echo Kurulum yeri: %INSTALL_DIR%
echo.
echo ÖNEMLİ: Bu pencereyi kapatın ve YENİ bir terminal açın.
echo PATH değişiklikleri yeni terminalde geçerli olacak.
echo.
echo Sonra şu komutu çalıştırın:
echo   ffmpeg -version
echo.
pause
