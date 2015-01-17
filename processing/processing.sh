cp -r download/videos/ processing/videos/
rm -r download/videos/*

FILENAME='video.mp4'
cd processing/videos

ffmpeg -i $FILENAME -ss 00:01:30 -t 00:00:30 -c copy ./processed/output1.mp4 
rm $FILENAME
cd ..
cd ..



# uncomment for video splitting
# <start> - the beginning of the part of a video ffmpeg is to cut out. Format: 00:00:00 - hours:minutes:seconds - hh:mm:ss- <duration> - the duration of the part of a video ffmpeg is to cut out. Format: 00:00:00 - hours:minutes:seconds - hh:mm:ss