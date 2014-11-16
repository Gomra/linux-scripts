#!/bin/bash
#
# mbo 
# install-script for bananapi
#
###############################################################################
# + + + + + ToDo + + + + +
# Missing programs / packages
#	+ Komodo edit
#
#
# Perform some configurations automatically
#	+ List of configuration
#
###############################################################################
# + + + + + List of packages to install + + + + + +
#
# curl
# fping
# lm-sensors
# lynx
# mysql
###############################################################################
START=`date`
#
# Variables
#
###############################################################################
echo "Install packages for your bananapi"
echo ""
echo "Step 1: Update & upgrade packages"
echo "Step 2: Install packages"
echo "Step 3: configurations files"
echo ""
echo "Let's start!"
echo ""
if [ ! -f ~/vimrc ]; then
	echo "File 'vimrc' does not exist in your homedir"
	echo "Put file into homedir and run the script again."
	echo ""
	fehler=1
fi
echo ""
if [ $fehler -ne 0 ]; then
	echo ""
	echo "One or more errors occured."
	echo "Copy files to your homedir and try to run this script again"
	echo ""
	exit 1
fi

# First we will update the system
echo "Step 1: Update System"
sudo apt-get update
sudo apt-get -y dist-upgrade

# Add all of the additional repositories
#echo "Step 3: Add Repos"
#echo ""
# Let's install the bunch of the new nice <<required>> software
echo "Step 2: INSTALLATION"
echo ""
sudo apt-get -y install curl fping lm-sensors lynx mysql
echo ""
sudo apt-get autoremove -y
sudo apt-get autoclean -y
echo ""
# Unhandled dependencies?
sudo apt-get -y install -f
echo ""
echo "Moving vim config"
sudo mv ~/vimrc /etc/vim/
echo ""
echo "All tasks done. Have fun!"
END=`date`
echo ""
echo "Start: $START"
echo "Ende: $END"
echo ""
exit 0
