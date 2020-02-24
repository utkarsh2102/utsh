#! /usr/bin/env zsh

tac uploads | grep urgency > list

cat list | while read line
do
    package=`echo $line | awk '{print $1}'`
    version=`echo $line | awk '{print $2}'`
    suite=`echo $line | awk '{print $3}'`
    echo "$package (${version:1:-1}) to ${suite: : -1}." >> to_post
done

rm list
sed -i 's/^/- /' to_post
sed -i 's/$/  /' to_post