# Don't run it. Don't source it. Just retype.

find . -type f -name '*old*' -exec rename 's/old/new/' {} +
