#!/usr/bin/bash 

if p[ "$#" -ne "1" ]]
then
    echo Usage: $(basename $0) filename.djvu >&2 
    exit 1
fi

if [[ ! -r "$1" ]]
then
    echo Non readable file "$1". >&2
    exit 1
fi

djvups "$1" | ps2pdf - "$1".pdf
