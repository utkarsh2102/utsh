#!/bin/zsh

YEAR_BEGIN=2011
YEAR_END=2021
URL="https://new.ubottu.com/meetingology/logs/ubuntu-meeting"

cd /tmp
mkdir core-dev-logs
cd core-dev-logs/

for i in {$YEAR_BEGIN..$YEAR_END}
do
  wget -r -np -A "*.log.txt" $URL/$i
done
