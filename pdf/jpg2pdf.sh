#!/bin/bash

cnt=0
for fname in *.jpg
do 
    new_name=$(printf %04d $cnt)
    # new_name=${fname%%.jpg}  # if you would like to keep the jpg names
    echo $new_name $fname
    convert -density 1000x1000 -quality 40 -compress jpeg $fname ${new_name}.pdf
    cnt=$(($cnt +1))
done

echo Bind the album into a single pdf with 
echo 'pdftk *.pdf cat output together.pdf'
