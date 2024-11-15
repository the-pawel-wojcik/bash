#!/bin/bash

if [[ ! -d cropped ]]
then
    mkdir cropped 
fi

for fname in *.png
do 
    if [[ ! -f "$fname" ]]
    then
        echo No images to crop. >&2
        exit 1 
    fi
    echo Cropping $fname.
    convert $fname -crop 1180x600+330+150 cropped/$fname
done
