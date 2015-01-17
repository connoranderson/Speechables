# Test download of a YouTube clip.

import pafy

url = "https://www.youtube.com/watch?v=bMt47wvK6u0"
video = pafy.new(url)
print video.title
print video.rating
print video.viewcount, video.author, video.length
print video.description

streams = video.streams
for s in streams:
    print(s)