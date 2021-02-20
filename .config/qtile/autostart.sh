#!/bin/sh

# network applet
nm-applet &
# systray battery icon
cbatticon -u 5 &
# systray volume
volumeicon &
# dropbox to sync org notes
dropbox &
# night colors changes
redshift &
# screenshot tool
flameshot &
# connection with phone
kdeconnect-indicator &
# regular eye breaks
safeeyes &
# polkit
# /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

# shortcut for opening apps
sxhkd &
