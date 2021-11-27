#!/bin/bash

# https://github.com/cramermarius/rofi-menus/blob/master/scripts/powermenu.sh
# options to be displayed
option0="lock"
option1="logout"
option2="suspend"
option3="scheduled suspend (10min)"
option4="scheduled suspend (20min)"
option5="scheduled suspend (30min)"
option6="reboot"
option7="shutdown"

# options passed into variable
options="$option0\n$option1\n$option2\n$option6\n$option7"

chosen="$(echo -e "$options" | rofi -lines 8 -dmenu -p "power")"
case $chosen in
    $option0)
        i3lock -e -f -c 333637;;
    $option1)
        i3-msg exit;;
    $option2)
        systemctl suspend;;
    $option6)
        systemctl reboot;;
	$option7)
        systemctl poweroff;;
esac
