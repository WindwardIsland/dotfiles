#!/bin/sh

# /etc/X11/xinit/xinitrc
#
# global xinitrc file, used by all X sessions started by xinit (startx)

xrandr
xrdb -load "$XDG_CONFIG_HOME/X11/xresources"

systemctl --user import-environment $DISPLAY
blueman-applet &
picom -b &
nitrogen --restore &
lxpolkit &
exec spectrwm
