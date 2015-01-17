import ffmpeg

subprocess.call('cp -r ../download/videos/ videos/', shell=True)


# ffmpeg -ss <start> -t <duration> -i in1.avi -sameq out1.avi
# uncomment for video splitting
# <start> - the beginning of the part of a video ffmpeg is to cut out. Format: 00:00:00 - hours:minutes:seconds - hh:mm:ss- <duration> - the duration of the part of a video ffmpeg is to cut out. Format: 00:00:00 - hours:minutes:seconds - hh:mm:ss