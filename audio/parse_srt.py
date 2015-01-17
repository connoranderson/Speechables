# Parse affordable.txt into text words

import re

def is_number(s):
    try:
        float(s)
        return True
    except ValueError:
        return False

with open("audio.srt") as f:
	lines = []
	for line in f:
		if ("-->" in line or (len(line) <= 2 and
			"\n" in line)):
			continue
		if (len(line) <= 4 and "\n" in line):
			continue
		lines.append(line.upper().rstrip())
myresult = []
for line in lines:
	myresult.extend(line.rstrip().split())
myresult = [i for i in myresult if not is_number(i)]
for m in myresult:
	print m.replace(":",'').replace(';','').replace('.','').replace(',',''),