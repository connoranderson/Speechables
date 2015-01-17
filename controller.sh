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
mv srt/content.srt audio/content.srt
echo 'Processing Video'
./processing/processing.sh