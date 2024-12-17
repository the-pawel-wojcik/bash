#!/usr/bin/bash 

if [[ "$#" -ne 1 ]] 
then
    echo Usage: $(basename $0) filename.svg >&2 
    exit 1
fi

if [[ ! -r "$1" ]]
then
    echo Non readable file "$1". >&2
    exit 1
fi

inkscape --export-type=pdf "$1"
