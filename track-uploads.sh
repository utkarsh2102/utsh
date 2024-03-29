#! /usr/bin/zsh

# uploads is a file, created manually from minechangelogs.
# list kind of a temporary file.
# the contents of to_post are posted to the blog.

tac uploads | grep urgency > list

cat list | while read line
do
    package=`echo $line | awk '{print $1}'`
    version=`echo $line | awk '{print $2}'`
    suite=`echo $line | awk '{print $3}'`
    echo "[$package](https://tracker.debian.org/pkg/$package) (${version:1:-1}) - ." >> to_post
done

sed -i 's/^/- /' to_post

cat to_post

rm list
rm to_post
rm uploads
