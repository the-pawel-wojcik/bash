#!/usr/bin/bash

# See the answer to 
# https://superuser.com/questions/448519/how-to-remove-watermark-from-pdf-using-pdftk

if [[ $# -ne 2 ]]
then
    {
        echo Usage: $(basename "$0") watermarked.pdf watermark
        # echo 
        # echo "  <watermark> is the text that will be removed."
        # echo "  Do word by word for multiline."
        # echo "  Unwatermarked file will be saved to fixed.pdf."
    } >&2
    exit 1
fi

if [[ ! -f "$1" ]] 
then
    echo Error: "$1" is not a file. >&2
    exit 1
fi

# Assure that nothing gets removed or overwritten
reserved_names=("uncompressed" "unwatermarked" "fixed")
for name in "${reserved_names[@]}"
do
    if [[ -f "${name}".pdf ]]
    then
        echo Error: a reserved filename ${name}.pdf already exists. >&2
        exit 1
    fi
done

pdftk "$1" output uncompressed.pdf uncompress
sed -e "s/$2//g" uncompressed.pdf > unwatermarked.pdf
pdftk unwatermarked.pdf output fixed.pdf compress
rm uncompressed.pdf
rm unwatermarked.pdf
