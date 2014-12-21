#!/bin/bash

# Install required packages for using trust 5.1 soundbox
# and make required changes in config
#
# mazienho <mazienho@gmx.de>
# 
# 2014-12-21 : v.0.1.0 
#
echo "Installation of trust 5.1 soundbox packages"

sudo apt-get update
sudo apt-get install -y pulseaudio pavucontrol

echo ""
echo "Checking for patch file:"
instdir=`pwd`
if [ ! -f $instdir/pulse-audio-6-channel.patch ]; then
	echo "Missing patch file. Please patch manually"
else
	sudo patch /etc/pulse/daemon.conf < $instdir/pulse-audio-6-channel.patch
	if [ $?!=0 ]; then
		echo "Patch failed. Please patch manually"
	fi
fi

exit 0
