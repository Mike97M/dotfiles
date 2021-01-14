#!/bin/sh

# network applet
nm-applet &
# systray battery icon
cbatticon -u 5 &
# systray volume
volumeicon &
# dropbox to sync org notes
dropbox &
# screenshot tool
flameshot &
# connection with phone
kdeconnect-indicator &
# night colors changes
redshift &
# regular eye breaks
safeeyes &
# polkit
# /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
