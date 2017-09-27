#!/bin/sh
# wait for the dock state to change
sleep 0.5
DOCKED=$(cat /sys/devices/platform/dock.0/docked)
case "$DOCKED" in
	"0")
       #undocked event - lets remove all connected outputs apart from LVDS
       for output in $(/usr/bin/xrandr -d :0.0 --verbose|grep " connected"|grep -v LVDS|awk '{print $1}')
         do
         /usr/bin/xrandr -d :0.0 --output $output --off
       done
	;;
	"1")
	#docked event - sample will created extended desktop with DVI1 to the right of LVDS1
	#/usr/bin/xrandr -d :0.0 --output DVI1 --right-of LVDS1 --auto
	;;
esac
exit 0
