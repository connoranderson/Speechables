import pafy
import os.path
import subprocess

url = "https://www.youtube.com/watch?v=Nbol8oMNggs"
video = pafy.new(url)
name = video.title.split()
title = ''
for word in name:
	title+=word+'\ '
title=title[:-2]
title+= '.mp4'
best = video.getbest(preftype="mp4")
filename = best.download(filepath="../download")
command = 'mv ' + title + ' ./videos/video.mp4'
subprocess.call(command, shell=True)

bestaudio = video.getbestaudio(preftype="ogg")
audiofile = bestaudio.download(filepath="../download")
title=title[:-4]
title+= '.ogg'
command = 'mv ' + title + ' ./audio/audio.ogg'
subprocess.call(command, shell=True)


