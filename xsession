#!/bin/bash
wmname LG3D #makes jvm believe i am running a different windows manager
#gnome-settings-daemon & #handles themes starts gnome-screensaver
urxvt &  #opens urxvt in backround to make it run faster
nm-applet & #for network manager
#gnome-power-manager & #power manager for netbook
xfce4-power-manager &
gnome-volume-manager & #for mounting cds, usbs etc
#awsetbg ~/Pictures/Wallpapers/NetbookWallpapers/NeedALongBlock.png &
redshift -l 43.7:-79.3 &

exec awesome #executes awesome WM
#exec ~/Documents/sam-conf/etc/dwm/dwm
#gconftool-2 --type bool --set /apps/nautilus/preferences/show_desktop false #Sets nautilus desktop to false
