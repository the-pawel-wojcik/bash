#!/bin/bash

# Decrease the input file size for gorq
# https://console.groq.com/docs/speech-to-text#audio-preprocessing

if [[ "$#" -ne 1 ]] 
then
    echo Usage: $(basename $0) input.file >&2
    echo Output will be saved as groq_input.flac >&2
    exit 2
fi

input=$1
output=groq_${input%.*}.flac

echo Converting $input to $output.
ffmpeg -i $input -ar 16000 -ac 1 -map 0:a -c:a flac $output
