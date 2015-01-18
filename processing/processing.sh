# cp -r download/videos/video.mp4 processing/videos/video.mp4
# rm -r download/videos/*
# cp -r download/audio/audio.ogg audio/audio.ogg
# rm -r download/audio/*

pwd
rm ./videos/processed/*

cp -r ../download/videos/video.mp4 ./videos/video.mp4
# rm -r download/videos/*

FILENAME='video.mp4'

cd ./videos
# avconv -framerate $FILENAME

while read line
do
    stringarray=($line)
    ABBR=${stringarray[0]}
    NAME=${stringarray[0]}'.mp4'
    # echo $NAME
    TIMESTAMP1=${stringarray[1]}
    # echo $TIMESTAMP1
    TIMESTAMP2=${stringarray[2]}
    # echo $TIMESTAMP2
    ISLONGWORD=${stringarray[3]}

    # # Continue if you see the file already
    # if [[ -f ./processed/$NAME ]]
    # then
    #     echo "Already saw $ABBR"
    #     continue
    # fi

    # If statement.
    if [[ $ISLONGWORD -eq '1' ]] # test if long word (has vid)
    then
        echo "Video for $ABBR"
        avconv -i video.mp4 -ss 00:00:01.00 -t 00:00:00.77 -c:a copy ./processed/$ABBR.mp4
        # avconv -i $FILENAME -ss $TIMESTAMP1 -t $TIMESTAMP2 -c:v -c:a copy ./processed/$ABBR.mp4    
    else
        echo "Non-audio video for short $ABBR"
        # echo "Sorry no vid for $NAME"
        # Create jpgs of that clip
        avconv -i $FILENAME -ss $TIMESTAMP1 -t $TIMESTAMP2 ./processed/$ABBR-%d.jpg

        # Create video of clip
        avconv -i ./processed/$ABBR-%d.jpg ./processed/$NAME

        # rm ./processed/*.jpg
        # ffmpeg -loop 1 -i img.jpg -i audio.wav -c:v libx264 -c:a aac -strict experimental -b:a 192k -shortest out.mp4

     #    # get audio
     #    avconv -i $FILENAME -ss $TIMESTAMP1 -t $TIMESTAMP2 temp.wav

        # # Combine back into a video with sound!
     #    avconv -loop -i $NAME-%d.jpg -i temp.wav -c:v libx264 -c:a copy -shortest ./processed/$NAME

     #    rm $NAME*.jpg
     #    rm temp.wav
    fi
    # # Make a video.
    # avconv -i $FILENAME -t $TIMESTAMP2 -ss $TIMESTAMP1 image-%d.jpg
    
    # ffmpeg -f image2 -i Path/To/File/filename%3d.jpg test.avi
    # avconv -pattern_type glob -i '*.jpg' -c:v libx264 $NAME.mp4
    # rm *.jpg

done < "$1"

#ffmpeg -i $FILENAME -ss 00:00:05 -t 00:00:05 -c copy ./processed/output1.mp4 
#rm $FILENAME
cd ..
cd ..



# uncomment for video splitting
# <start> - the beginning of the part of a video ffmpeg is to cut out. Format: 00:00:00 - hours:minutes:seconds - hh:mm:ss- <duration> - the duration of the part of a video ffmpeg is to cut out. Format: 00:00:00 - hours:minutes:seconds - hh:mm:ss