#!/bin/bash

cnt=0
for fname in *.jpg
do 
    convert -density 1000x1000 -quality 40 -compress jpeg $fname $cnt
    cnt=$(($cnt +1))
done

echo Bind the album into a single pdf with 
echo pdftk *.pdf cat output together.pdf
