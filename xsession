#!/bin/bash

pasystray &
nm-applet & #for network manager
if [[ -f $HOME/.screenlayout/$HOSTNAME-screenlayout.sh ]]; then
    $HOME/.screenlayout/$HOSTNAME-screenlayout.sh
fi

#redshift -l 43.7:-79.3 &
exec awesome -c ~/.awesomevm-errors 2>&1 #executes awesome WM
