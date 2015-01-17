import pafy
import os.path

url = "https://www.youtube.com/watch?v=Nbol8oMNggs"
video = pafy.new(url)
best = video.getbest(preftype="mp4")
filename = best.download(filepath="../download/videos/")
