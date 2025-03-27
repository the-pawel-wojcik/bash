# Don't run it. Don't source it. Just retype.
find . -type f -name '*old*' -exec rename 's/old/new/' {} +

# Replace only the last part of the filename
find . -name '*v1*' -exec rename 's/(.*)v1/\1v0/' '{}' ';'
# rename works different on different distributions

# A fun one from stackoverflow
# https://stackoverflow.com/questions/79490486/rename-multiple-files-in-nested-directories/79498331#79498331
# get files in sensible order, echo commands below to confirm
find . -depth -name key_A | 
while read -r f
do 
    post="${f##*old}"
    pre="${f%old$post}"
    echo mv "$f" "${pre}new$post"
done

