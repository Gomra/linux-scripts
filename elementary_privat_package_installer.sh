#!/bin/bash
#
# mbo 
# install-script for elementary os
# v.0.2 :  2014-10-31 - Add insync repository
# v.0.1 :  2014-10-20 - initial version of the script
#
###############################################################################
# + + + + + ToDo + + + + +
# Missing programs / packages
#	+ Komodo edit
#
#
# Install Guake-Patch
# Perform some configurations automatically
#	+ List of configuration
#		- synaptics_touchpad
#		- thunderbird-config
#		- synapse-config
#		- autokey-config
#		- evolution-config ?
#		- nsswitch, network-configuration: wlan-cert
#		- gtkrc /usr/share/themes/elementary/gtk-2.0/gtkrc
#
# Optional config
#	+ conky
#	+ vpn
#	+ keepass2
#	
#
#
###############################################################################
# + + + + + List of installed packages to remove + + + + +
# geary
# midori-granite
# noise
# software-center
# scratch-text-editor
#
###############################################################################
# + + + + + List of packages to install + + + + + +
# aptitude
# autokey-gtk
# bluefish bluefish-plugins
# btsync-gui
# ccrypt
# chromium-browser chromium-browser-l10n
# conky conky-all conky-manager
# dconf-editor
# docker.io
# dropbox # http://wiki.ubuntuusers.de/Dropbox
# elementary-tweaks
# filezilla
# firefox firefox-locale-de
# flashplugin-installer
# gedit
# gimp
# git
# gitg
# google-chrome # https://dl.google.com/linux/direct/google-chrome-stable_current_i386.deb
# gparted
# gsynaptics
# guake
# guayadeque
# hddtemp
# insync
# java # -->openjdk-7-jre openjdk-7-jdk
# keepass2
# labyrinth	# mind mapping tool
# libreoffice libreoffice-l10n-de
# mc # Midnight Commander
# meld
# nixnote
# openjdk-7-jdk
# openjdk-7-jre
# pdftk
# pepperflashplugin-nonfree
# pinta
# pm-utils
# poedit
# pv # Durchsatzmessung von Pipes
# rdesktop
# shutter
# skype  
# spotify-client
# sublime-text
# subversion
# synapse
# synaptic
# sysv-rc-conf
# teamviewer
# thunderbird thunderbird-locale-de
# tomboy
# transmission
# vim
# virtualbox
# vlc
# wine winetricks playonlinux # latest version from PPA
# xbindkeys xbindkeys-config xkbset # For keyboard manipulation (e.g. "CapsLock=MidMouse")
#
###############################################################################
START=`date`
#
# Variables
#
bashrc=~/.bashrc
bashali=~/.bash_aliases
fehler=0
#
###############################################################################
echo "Install frequently used software for Ubuntu based Linux Distros"
echo ""
echo "Step 1: Check for config files"
echo "Step 2: Update & upgrade packages"
echo "Step 3: Remove non used packages"
echo "Step 4: Add repos"
echo "Step 5: Install packages"
echo ""
echo "Let's start!"
echo ""
echo "Step 1: Checking for the config files"
echo ""
if [ ! -f ~/guake.patch ]; then
	echo "File 'guake.patch' does not exist in your homedir"
	echo "Put file into homedir and run the script againt"
	echo ""
	fehler=1
fi
echo ""
if [ ! -f ~/vimrc ]; then
	echo "File 'vimrc' does not exist in your homedir"
	echo "Put file into homedir and run the script againt"
	echo ""
	fehler=1
fi
echo ""
if [ ! -f ~/bash_aliases ]; then
	echo "File 'bash_aliases (not the original hidden!!!)' does not exist in your homedir"
	echo "Put file into homedir and run the script againt"
	echo ""
	fehler=1
fi
echo ""
if [ ! -f ~/middle-click.sh ]; then
	echo "File 'middle-click.sh' does not exist in your homedir"
	echo "Put file into homedir and run the script againt"
	echo ""
	fehler=1
fi
if [ $fehler -ne 0 ]; then
	echo ""
	echo "One or mor errors occured."
	echo "Copy files to your homedir and try to run this script again"
	echo ""
	exit 1
fi

# First we will update the system
echo "Step 2: Update System"
sudo apt-get update
sudo apt-get -y dist-upgrade

# Add all of the additional repositories
echo "Step 3: Add Repos"
echo ""
# Birdie - Twitter client
echo "Adding Birdie - Twitter Client"
sudo apt-add-repository -y ppa:birdie-team/stable
# BitTorrent Sync
echo "Adding BitTorrent Sync"
sudo apt-add-repository -y ppa:tuxpoldo/btsync
# Conky Manager
echo "Adding Conky Manager"
sudo apt-add-repository -y ppa:teejee2008/ppa
# Dropbox
echo "Adding Dropbox"
sudo apt-add-repository -y 'deb http://linux.dropbox.com/ubuntu trusty main'
sudo apt-key adv --keyserver pgp.mit.edu --recv-keys 5044912E
# Elementary Tweaks
echo "Adding Elementary Tweaks"
sudo apt-add-repository -y ppa:mpstark/elementary-tweaks-daily
# Insync
echo "Adding Insync"
wget -qO - https://d2t3ff60b2tol4.cloudfront.net/services@insynchq.com.gpg.key | sudo apt-key add -
sudo echo "#Add Insync Repository" >> /etc/apt/sources.list
sudo echo "deb http://apt.insynchq.com/ubuntu trusty non-free contrib" >> /etc/apt/sources.list
# NixNote
echo "Adding NixNote"
sudo apt-add-repository -y ppa:vincent-c/nevernote
# Skype
echo "Adding Skype"
sudo apt-add-repository -y 'deb http://archive.canonical.com/ubuntu/ trusty partner'
sudo apt-add-repository -y 'deb-src http://archive.canonical.com/ubuntu/ trusty partner'
# Spotify
echo "Adding Spotify"
sudo apt-add-repository -y 'deb http://repository.spotify.com/ stable non-free' 
sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 94558F59
# Sublime text editor
echo "Adding Sublime Text Editor"
sudo apt-add-repository -y ppa:webupd8team/sublime-text-2
# Synapse - testing // no errors occured until now
echo "Adding Synapse"
sudo apt-add-repository -y ppa:synapse-core/testing
# Wine
echo "Adding Wine"
sudo apt-add-repository -y ppa:ubuntu-wine/ppa
echo ""
sudo apt-get update
echo ""
# Let's install the bunch of the new nice <<required>> software
echo "Step 4: INSTALLATION"
echo ""
sudo apt-get -y install aptitude autokey-gtk bluefish bluefish-plugins btsync-gui ccrypt chromium-browser chromium-browser-l10n conky conky-all conky-manager dconf-editor docker.io dropbox elementary-tweaks flashplugin-installer filezilla firefox firefox-locale-de gedit gdebi gimp git gitg gparted gsynaptics guake guayadeque hddtemp insync keepass2 labyrinth libreoffice libreoffice-l10n-de mc meld nixnote openjdk-7-jre openjdk-7-jdk pdftk pepperflashplugin-nonfree pinta playonlinux pm-utils poedit pv rdesktop shutter skype spotify-client sublime-text subversion synapse synaptic sysv-rc-conf thunderbird thunderbird-locale-de tomboy transmission vim virtualbox vlc wine1.7 winetricks xbindkeys xbindkeys-config xkbset
echo ""
sudo dpkg --add-architecture i386
echo "Install Teamviewer"
wget -O ~/Downloads/teamviewer.deb http://www.teamviewer.com/download/teamviewer_linux.deb
sudo gdebi -n ~/Downloads/teamviewer.deb
echo "Install Google Chrome"
wget -O ~/Downloads/googlechrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_i386.deb
sudo gdebi -n ~/Downloads/googlechrome.deb

# Let's get rid of unnecessary software packages
echo "Step 5:  remove unnecessary software packages"
sudo apt-get purge -y midori-granite
sudo apt-get purge -y noise
sudo apt-get purge -y geary 
sudo apt-get purge -y software-center
sudo apt-get purge -y scratch-text-editor
sudo apt-get autoremove -y
sudo apt-get autoclean -y
echo ""
# Unhandled dependencies?
sudo apt-get -y install -f
echo "Patching Guake"
sudo patch /usr/bin/guake < ~/guake.patch
rm ~/guake.patch
echo "Moving vim config"
sudo mv ~/vimrc /etc/vim/
echo ""
mv ~/bashrc /.bashrc
echo "" >> $bashrc
echo "# Middle MouseButton on Capslock" >> $bashrc
echo "if [ -f ~/.middle-click.sh ]; then" >> $bashrc
echo "    . ~/.middle-click.sh" >> $bashrc
echo "fi" >> $bashrc
mv ~/bash_aliases ~/.bash_aliases
echo "Have fun!"

END=`date`

echo ""
echo "Start: $START"
echo "Ende: $END"

exit 0
