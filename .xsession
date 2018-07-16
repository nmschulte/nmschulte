#!/usr/bin/env sh

# DISABLE THE STICK, cuz of shit hardware
#xinput disable 15
xinput | grep 'AlpsPS/2 ALPS DualPoint Stick' | sed -n 's/.*id=\([0-9]\+\).*/\1/p' | xargs xinput disable

# need these binaries ...
export PATH="/home/nmschulte/.local/bin:$PATH"

# auto setup X11 Outputs
autorandr --change --force laptop

# set root window background to solid dark gray color
#xsetroot -solid "#181818"
# set composite-friendly root window background to tiled image
#hsetroot -solid "#181818" -full ~/Desktop/backgrounds/MeerKAT_Galactic-Centre_Low-Res.jpg
background.sh
sh -c "while true; do sleep 300.0s; background.sh 1; done" & BG_PID=$!

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
kill $BG_PID
