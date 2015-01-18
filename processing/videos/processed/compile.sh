INPUTSENTENCE='engineering engineering'
SENTENCE=${INPUTSENTENCE,,}
wordarray=($SENTENCE)
echo ${wordarray[0]}
CAT='"concat:'

for x in "${wordarray[@]}"
do
	CAT=$CAT$x".mp4|"
done
CAT=${CAT::-1}
CAT=$CAT'"'
echo $CAT
avconv -i $CAT -c copy 1.mp4
