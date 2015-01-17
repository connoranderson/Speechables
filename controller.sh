# Controls all subdirectory run files

cd download/
echo 'Downloading video from specified url'
python download.py
cd ..
cd srt/
echo 'Acquiring Subtitles'
python downloadsrt.py
cd ..
echo 'Processing Video'
./processing/processing.sh