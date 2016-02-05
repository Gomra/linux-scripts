#!/bin/bash

#mazienho
# Add / Remove plank docks on two connected displays
#
####################################################
#
# This is the name of the connected display
# You can find out by typing "xrandr -q" in terminal and look for connected displays

displ_name=HDMI1
####################################################
con_mon=/tmp/xrandr.txt
myprocs=/tmp/cerbprocs

`xrandr -q > $con_mon`
if grep -q "$displ_name disconnected" $con_mon; then
	`gsettings reset org.pantheon.cerbere monitored-processes`
	piddock2=`ps -ef | grep "plank -n dock2" | grep -v grep | cut -d" " -f5`
	if [[ $piddock2 != 0 ]]; then
		kill $piddock2
	fi
	exit 0
fi
if grep -q "$displ_name connected" $con_mon; then
	`gsettings get org.pantheon.cerbere monitored-processes > $myprocs`
	if grep -q "plank -n dock2" $myprocs; then
	exit 0
	fi
	newcerb=`sed -- "s/]/, 'plank -n dock2']/g" $myprocs`
	`gsettings set org.pantheon.cerbere monitored-processes "$newcerb"`
fi
# We never should come here
exit 1
