#!/bin/bash

displ_name=eDP1
con_mon=/tmp/xrandr.txt
myprocs=/tmp/cerbprocs

`xrandr -q > $con_mon`
if grep -q "$displ_name disconnected" $con_mon; then
	`gsettings reset org.pantheon.desktop.cerbere monitored-processes`
	piddock2=`ps -ef | grep "plank -n dock2" | grep -v grep | cut -d" " -f4`
	if [[ $piddock2 != 0 ]]; then
		kill $piddock2
	fi
	exit 0
fi
if grep -q "$displ_name connected" $con_mon; then
	`gsettings get org.pantheon.desktop.cerbere monitored-processes > $myprocs`
	if grep -q "plank -n dock2" $myprocs; then
	exit 0
	fi
	newcerb=`sed -- "s/]/, 'plank -n dock2']/g" $myprocs`
	`gsettings set org.pantheon.desktop.cerbere monitored-processes "$newcerb"`
fi
# We never should come here
exit 1
