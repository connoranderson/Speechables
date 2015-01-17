cp -r download/videos/video.mp4 processing/videos/video.mp4
rm -r download/videos/*
cp -r download/audio/audio.ogg audio/audio.ogg
rm -r download/audio/*

FILENAME='video.mp4'
AUDIONAME='audio.ogg'

cd audio

ffmpeg -i $AUDIONAME audio.wav
rm $AUDIONAME

cd ..

cd processing/videos

# while read line
# do
#     lineText=$line
#     stringarray($lineText)
#     NAME = stringarray[0] + '.mp4'
#     echo $NAME
#     TIMESTAMP = stringarray[1]
#     ffmpeg -i $FILENAME -ss 00:00:05 -t 00:00:05 -c copy ./processed/$NAME    
# done < $1

ffmpeg -i $FILENAME -ss 00:00:05 -t 00:00:05 -c copy ./processed/output1.mp4 
rm $FILENAME
cd ..
cd ..



# uncomment for video splitting
# <start> - the beginning of the part of a video ffmpeg is to cut out. Format: 00:00:00 - hours:minutes:seconds - hh:mm:ss- <duration> - the duration of the part of a video ffmpeg is to cut out. Format: 00:00:00 - hours:minutes:seconds - hh:mm:ss