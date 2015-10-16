#!/bin/bash

displ_name=VGA1
con_mon=/tmp/xrandr.txt
myprocs=/tmp/cerbprocs

echo "START" >> /tmp/test
###
`xrandr -q > $con_mon`
if grep -q "$displ_name disconnected" $con_mon; then
	`gsettings reset org.pantheon.desktop.cerbere monitored-processes`
	exit 0
fi
if grep -q "$displ_name connected" $con_mon; then
	`gsettings get org.pantheon.desktop.cerbere monitored-processes > $myprocs`
	if grep -q "plank -n dock2" $myprocs; then
	exit 0
	fi
	newcerb=`sed -- "s/]/, 'plank -n dock2']/g" $myprocs`
	`gsettings set org.pantheon.desktop.cerbere monitored-processes "$newcerb"`

### TEST
#else
#	echo disconnected `date`> /tmp/con_mon.txt
fi
# We never should come here
exit 1
