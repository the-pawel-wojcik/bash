find . -type f -print0 | while IFS= read -r -d '' file
do
    echo $file
done

# -print0 tells find to print the full file name followed by a null character.
# This helps in safely handling file names with spaces or special characters.


# file names are processed correctly, even if they contain spaces, newlines, or
# other special characters.
