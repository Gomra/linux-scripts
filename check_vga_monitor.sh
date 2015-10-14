#!/bin/bash

con_mon=/home/mbouws/btsync/private/linux/scripts/xrandr.txt
`xrandr -q > $con_mon`

if grep -q "VGA1 connected" $con_mon; then
	
	echo connected > /tmp/con_mon.txt
else
	echo disconnected > /tmp/con_mon.txt
fi

exit 0
