#!/usr/bin/env sh

# need these binaries ...
export PATH="/home/nmschulte/.local/bin:$PATH"

# set root window background to solid dark gray color
xsetroot -solid "#181818"
# set composite-friendly root window background to tiled image
#hsetroot -tile ~/Downloads/tilable-starfield-patterns-4.jpg

# auto setup X11 Outputs
autorandr.py --change --force --default laptop
#sleep 1

# i3 (window manager)
i3 & wmpid=$!
#/home/nmschulte/.local/bin/i3
#/usr/bin/i3

# xedgewarp (warps the mouse at Output edges)
xedgewarp -b -m closest -t none &

# Compton (compositing manager)
#comption -bfCG --backend glx &

# PulseAudio tray app (sound manager/router)
#pulseaudio
pasystray &

# UDisks tray app (block device / removable storage manager)
udiskie --tray &

# KeePassX (secure secrets/credentials manager)
keepassx &

# BlueZ tray app, Blueman (bluetooth manager)
blueman-applet &

# Pidgin (instant messenger)
#pidgin &

# and wait ...
wait $wmpid
