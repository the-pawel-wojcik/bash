#!/usr/bin/bash

# See the answer to 
# https://superuser.com/questions/448519/how-to-remove-watermark-from-pdf-using-pdftk

if [[ $# -ne 3 ]]
then
    echo "Usage: $(basename $0) original.pdf text replacement"
    exit 1
fi

if [[ ! -f "$1" ]] 
then
    echo "Error: $1 is not a file."
    exit 1
fi

# Assure that nothing gets removed or overwritten
reserved_names=("uncompressed" "replaced" "fixed")
for name in ${reserved_names[@]}
do
    if [[ -f ${name}.pdf ]]
    then
        echo "Error: a file called ${name}.pdf exists in the directory."
        exit 1
    fi
done

pdftk "$1" output uncompressed.pdf uncompress
sed -e "s/$2/$3/g" uncompressed.pdf > replaced.pdf
pdftk replaced.pdf output fixed.pdf compress
rm uncompressed.pdf
rm replaced.pdf
