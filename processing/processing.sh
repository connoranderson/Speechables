#!/bin/bash

cp -r ../download/videos/ ./videos/
#rm -r ../download/videos/
#uncomment to remove video from download folder

FILENAME='video.mp4'
cd videos

ffmpeg -i $FILENAME -ss 00:01:30 -t 00:02:00 -c copy ./processed/output1.mp4 

#ffmpeg -i video.mp4 -vcodec copy -acodec copy -ss 00:04:41 -t 00:04:44 editedfile.mp4

# ffmpeg -ss 00:04:41 -t 00:04:44 -i video.mp4 -acodec copy \ 
# -vcodec copy editedfile.mp4

#ffmpeg -ss 00:04:41 -t 00:00:03 -i $FILENAME -sameq $FILENAME

# uncomment for video splitting
# <start> - the beginning of the part of a video ffmpeg is to cut out. Format: 00:00:00 - hours:minutes:seconds - hh:mm:ss- <duration> - the duration of the part of a video ffmpeg is to cut out. Format: 00:00:00 - hours:minutes:seconds - hh:mm:ss