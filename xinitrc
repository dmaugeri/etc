#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

export EDITOR="vim"

xrdb -merge ~/.Xresources
redshift -l 43.7:-79.3 &
exec awesome -c ~/.config/awesome/rc.lua
