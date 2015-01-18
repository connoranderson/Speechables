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

    # Continue if you see the file already
    if [[ -f ./processed/$NAME ]]
    then
        echo "Already saw $ABBR"
        continue
    fi

    # If statement.
    if [[ $ISLONGWORD -eq '1' ]] # test if long word (has vid)
    then
        echo "Video for $ABBR"
        avconv -i video.mp4 -ss $TIMESTAMP1 -t $TIMESTAMP1 -c:a copy ./processed/$ABBR.mp4
    else
        echo "Non-audio video for short $ABBR"
        # echo "Sorry no vid for $NAME"
        # Create jpgs of that clip
        avconv -i $FILENAME -ss $TIMESTAMP1 -t $TIMESTAMP2 ./processed/$ABBR-%d.jpg

        # Get the audio
        avconv -i $FILENAME -ss $TIMESTAMP1 -t $TIMESTAMP2 ./processed/$ABBR.wav

        # Create video of clip
        avconv -i ./processed/$ABBR-%d.jpg ./processed/silent_$NAME

        # Add audio to video
        avconv -i ./processed/silent_$NAME -i ./processed/$ABBR.wav -shortest ./processed/$NAME

        rm ./processed/*.jpg
        rm ./processed/$ABBR.wav
        rm ./processed/silent*

    fi

done < "$1"

cd ..
cd ..