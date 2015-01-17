# format the output into the pretty format
# "word starttime endtime"

with open("audio_output.txt") as f:
	text = ''.join([l.rstrip() for l in f if len(l.rstrip()) > 0])
text = text.split("X real time")[1]
text = text.split(' ')
text = [t.replace('(',' ').replace(')',' ')
	.replace(',',' ').rstrip() for t in text]

for t in text:
	print t