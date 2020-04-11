#! /usr/bin/zsh

set -a
source environment        # bash -> env > environment -> exit
set +a

# Copyright 2020, Utkarsh Gupta <utkarsh@debian.org>

# to be run for the first time only :)
# for libnotify-bin
if [ $(dpkg-query -W -f='${Status}' libnotify-bin 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
  sudo apt install libnotify-bin;
fi

# for espeak
if [ $(dpkg-query -W -f='${Status}' espeak 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
  sudo apt install espeak;
fi

# determine the current battery
current_battery=$(acpi -b | cut -d"," -f2 | sed 's/%//g' | awk '$1=$1')
#echo $current_battery       # uncomment for debugging

# determine wheter it is on charging mode or not
current_status=$(acpi -b | grep -c "Charging")
#echo $current_status       # uncomment for debugging

# ping when charging > 90 and still charging
if [[ $current_status -eq 1 && $current_battery -gt 90 ]]
then
  export DISPLAY=:0.0
  notify-send -u critical -t 10000 "REMOVE CHARGING, YOU STUPID PERSON!"
  # echo "VISIBLE?"        # uncomment for debugging
  espeak -g 10 -a 200 -p 99 "REMOVE CHARGING, YOU STUPID PERSON!"
fi

# ping when charging < 10 and not charging
if [[ $current_status -eq 0 && $current_battery -lt 10 ]]
then
  export DISPLAY=:0.0
  notify-send -u critical -t 10000 "PUT ON CHARGING, YOU STUPID PERSON!"
  # echo "VISIBLE?"        # uncomment for debugging
  espeak -g 10 -a 200 -p 99 "PUT ON CHARGING, YOU STUPID PERSON!"
fi

# to run this script every 30 minutes, do the following:
# crontab -e
# */15 * * * * /home/utkarsh/battery-alert.sh
# save and exit; you're good to go!
# additionally, if you don't want to receive mail for each job, do the following:
# crontab -e
# on the very first line, set: MAILTO=""
# save and exit; you're good to go!
