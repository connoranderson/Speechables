# Controls all subdirectory run files

cp url.py download/
cp url.py srt/

cd download/
echo 'Downloading video from specified url'
python download.py
cd ..
cd srt/
echo 'Acquiring Subtitles'
python downloadsrt.py
cd ..
mv srt/content.srt audio/audio.srt
echo 'Converting audio into chunks'
audio/resample.sh
# echo 'Processing Video'
# ./processing/processing.sh