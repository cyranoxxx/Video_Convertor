import os
import sys
from pathlib import Path
import subprocess
import whisper
from deep_translator import GoogleTranslator
from gtts import gTTS
from moviepy.editor import VideoFileClip, AudioFileClip
import logging

# Logging ayarları
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')
logger = logging.getLogger(__name__)

class VideoTranslator:
    def __init__(self, input_folder=".", output_folder="output", temp_folder="temp"):
        """
        Video çevirici sınıfı
        
        Args:
            input_folder: Video dosyalarının bulunduğu klasör
            output_folder: İşlenmiş videoların kaydedileceği klasör
            temp_folder: Geçici dosyaların kaydedileceği klasör
        """
        self.input_folder = Path(input_folder)
        self.output_folder = Path(output_folder)
        self.temp_folder = Path(temp_folder)
        
        # Klasörleri oluştur
        self.output_folder.mkdir(exist_ok=True)
        self.temp_folder.mkdir(exist_ok=True)
        
        # Whisper modelini yükle (base model kullanıyoruz, daha hızlı)
        logger.info("Whisper modeli yükleniyor...")
        self.whisper_model = whisper.load_model("base")
        
        # Google Translate için translator (deep-translator kullanarak)
        self.translator = GoogleTranslator(source='auto', target='tr')
        
        # Desteklenen video formatları
        self.video_extensions = ['.mp4', '.avi', '.mov', '.mkv', '.flv', '.wmv', '.webm', '.ts']
    
    def extract_audio(self, video_path, audio_path):
        """Video dosyasından sesi çıkar"""
        logger.info(f"Ses çıkarılıyor: {video_path.name}")
        try:
            video = VideoFileClip(str(video_path))
            video.audio.write_audiofile(str(audio_path), verbose=False, logger=None)
            video.close()
            return True
        except Exception as e:
            logger.error(f"Ses çıkarma hatası: {e}")
            return False
    
    def transcribe_audio(self, audio_path):
        """Sesi metne dönüştür"""
        logger.info(f"Ses metne dönüştürülüyor...")
        try:
            result = self.whisper_model.transcribe(str(audio_path))
            return result["text"]
        except Exception as e:
            logger.error(f"Ses tanıma hatası: {e}")
            return None
    
    def translate_text(self, text, dest_lang='tr'):
        """Metni Türkçe'ye çevir"""
        logger.info("Metin Türkçe'ye çevriliyor...")
        try:
            # Uzun metinleri parçalara ayır (Google Translate limiti - 5000 karakter)
            max_length = 4500  # Güvenli limit
            if len(text) <= max_length:
                translation = self.translator.translate(text)
                return translation
            else:
                # Metni cümlelere böl ve parça parça çevir
                sentences = text.split('. ')
                translated_sentences = []
                current_chunk = ""
                
                for sentence in sentences:
                    if len(current_chunk) + len(sentence) + 2 < max_length:
                        current_chunk += sentence + ". "
                    else:
                        if current_chunk:
                            translation = self.translator.translate(current_chunk.strip())
                            translated_sentences.append(translation)
                        current_chunk = sentence + ". "
                
                if current_chunk:
                    translation = self.translator.translate(current_chunk.strip())
                    translated_sentences.append(translation)
                
                return " ".join(translated_sentences)
        except Exception as e:
            logger.error(f"Çeviri hatası: {e}")
            return None
    
    def text_to_speech(self, text, output_path, lang='tr'):
        """Metni sese dönüştür"""
        logger.info("Metin sese dönüştürülüyor...")
        try:
            tts = gTTS(text=text, lang=lang, slow=False)
            tts.save(str(output_path))
            return True
        except Exception as e:
            logger.error(f"Ses oluşturma hatası: {e}")
            return False
    
    def combine_audio_video(self, video_path, audio_path, output_path):
        """Yeni sesi video ile birleştir"""
        logger.info("Ses ve video birleştiriliyor...")
        try:
            video = VideoFileClip(str(video_path))
            audio = AudioFileClip(str(audio_path))
            
            # Ses dosyasının uzunluğunu video ile eşitle
            if audio.duration < video.duration:
                logger.warning("Ses dosyası videodan kısa, boşluk eklenecek")
            elif audio.duration > video.duration:
                # Ses hızlandırılarak video süresine eşitleniyor
                speed_factor = audio.duration / video.duration
                logger.warning(f"Ses dosyası videodan uzun, {speed_factor:.2f}x hızlandırılacak")
                # MoviePy'da speedx direkt audio üzerinde çağrılır
                audio = audio.fx(lambda clip: clip.speedx(speed_factor))
            
            final_video = video.set_audio(audio)
            final_video.write_videofile(
                str(output_path), 
                codec='libx264', 
                audio_codec='aac',
                verbose=False,
                logger=None
            )
            
            video.close()
            audio.close()
            final_video.close()
            
            return True
        except Exception as e:
            logger.error(f"Video birleştirme hatası: {e}")
            return False
    
    def process_video(self, video_path):
        """Tek bir video dosyasını işle"""
        logger.info(f"\n{'='*50}")
        logger.info(f"Video işleniyor: {video_path.name}")
        logger.info(f"{'='*50}")
        
        # Geçici dosya yolları
        temp_audio_original = self.temp_folder / f"{video_path.stem}_original.mp3"
        temp_audio_turkish = self.temp_folder / f"{video_path.stem}_turkish.mp3"
        
        # Çıktı dosyası
        output_video = self.output_folder / f"{video_path.stem}_turkish{video_path.suffix}"
        
        try:
            # 1. Sesi çıkar
            if not self.extract_audio(video_path, temp_audio_original):
                return False
            
            # 2. Sesi metne dönüştür
            text = self.transcribe_audio(temp_audio_original)
            if not text:
                return False
            
            logger.info(f"Tanınan metin: {text[:100]}...")
            
            # 3. Metni Türkçe'ye çevir
            turkish_text = self.translate_text(text)
            if not turkish_text:
                return False
            
            logger.info(f"Çevrilen metin: {turkish_text[:100]}...")
            
            # 4. Türkçe metni sese dönüştür
            if not self.text_to_speech(turkish_text, temp_audio_turkish):
                return False
            
            # 5. Yeni sesi video ile birleştir
            if not self.combine_audio_video(video_path, temp_audio_turkish, output_video):
                return False
            
            logger.info(f"✓ Başarılı! Çıktı: {output_video}")
            
            # Geçici dosyaları temizle
            temp_audio_original.unlink(missing_ok=True)
            temp_audio_turkish.unlink(missing_ok=True)
            
            return True
            
        except Exception as e:
            logger.error(f"Video işleme hatası: {e}")
            # Geçici dosyaları temizle
            temp_audio_original.unlink(missing_ok=True)
            temp_audio_turkish.unlink(missing_ok=True)
            return False
    
    def process_all_videos(self):
        """Klasördeki tüm videoları işle"""
        video_files = []
        for ext in self.video_extensions:
            video_files.extend(list(self.input_folder.glob(f"*{ext}")))
            video_files.extend(list(self.input_folder.glob(f"*{ext.upper()}")))
        
        if not video_files:
            logger.warning(f"Klasörde video dosyası bulunamadı: {self.input_folder}")
            return
        
        logger.info(f"Toplam {len(video_files)} video dosyası bulundu")
        
        successful = 0
        failed = 0
        
        for video_file in video_files:
            if self.process_video(video_file):
                successful += 1
            else:
                failed += 1
        
        logger.info(f"\n{'='*50}")
        logger.info(f"İşlem tamamlandı!")
        logger.info(f"Başarılı: {successful}")
        logger.info(f"Başarısız: {failed}")
        logger.info(f"{'='*50}")

def main():
    """Ana program"""
    print("Video Ses Çevirici - Türkçe")
    print("="*50)
    
    # Varsayılan olarak 'input' klasörünü kullan
    if len(sys.argv) > 1:
        input_folder = sys.argv[1]
    else:
        input_folder = "input"
    
    # input klasörünü oluştur (yoksa)
    Path(input_folder).mkdir(exist_ok=True)
    
    # Video çeviriciyi başlat
    translator = VideoTranslator(
        input_folder=input_folder,
        output_folder="output",
        temp_folder="temp"
    )
    
    # Tüm videoları işle
    translator.process_all_videos()

if __name__ == "__main__":
    main()
