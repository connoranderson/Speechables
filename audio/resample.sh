# Note this requires sox.

# Parse SRT file. Only if need to with raw input.
python parse_srt.py > audio_parsed.srt

# Convert into 16 htz, mono, little endian.
sox audio.wav -r 16000 -c 1 -L audio_resampled.wav

cd sphinx_align/

# Note that you need to build sphinx_align.
java -ms400m -mx1500m -jar bin/aligner.jar ../audio_resampled.wav ../audio_parsed.srt > ../audio_output.txt

cd ../

# Parse the output into an easy format.
python format_output.py > final_output_parsed.txt