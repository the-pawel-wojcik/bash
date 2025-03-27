#!/bin/bash

if [[ "$#" -ne 1 ]] 
then
    echo Usage: $(basename $0) 'filename.jpg|filename.png' >&2 
    exit 1
fi

if [[ ! -r "$1" ]]
then
    echo Non readable file "$1". >&2
    exit 1
fi

convert -density 1000x1000 -quality 40 -compress jpeg $fname ${new_name}.pdf
