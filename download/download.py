import pafy

url = "https://www.youtube.com/watch?v=8gXBkOYZYnk"
video = pafy.new(url)

best = video.getbest(preftype="mp4")

filename = best.download(filepath="../videos/", quiet=False)