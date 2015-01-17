# Controls all subdirectory run files

cd download/
echo 'Downloading video from specified url'
python download.py
cd ..
echo 'Processing video'
./processing/processing.sh