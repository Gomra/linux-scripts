#!/bin/bash
#
# mbo 
# install-script for elementary os
# v0.4 :  2015-08-28 - Removed Nixnote, Birdie
# v0.3 :  2015-05-09 - Removed wine, virtualbox; changed docker
# v0.2 :  2014-10-31 - Add insync repository
# v0.1 :  2014-10-20 - initial version of the script
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
#		- vimrc
#		- bashrc, bash_alias
#		- middle-click.sh
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
###############################################################
#
# hp printer (hplip?)
# 
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
# dia
# docker (lxc-docker)
# dropbox # http://wiki.ubuntuusers.de/Dropbox
# elementary-tweaks
# filezilla
# firefox firefox-locale-de
# flashplugin-installer
# gedit
# gimp
# git
# gitg
# go for it
# google-chrome # https://dl.google.com/linux/direct/google-chrome-stable_current_i386.deb <-- Removed due to indicator icons erros
# gparted
# gsynaptics
# guake
# guayadeque
# hddtemp
# hipchat
# imagemagick
# insync
# java # -->openjdk-7-jre openjdk-7-jdk
# jxplorer
# keepass2
# labyrinth	# mind mapping tool
# libreoffice libreoffice-l10n-de
# mc # Midnight Commander
# meld
# nixnote
# openjdk-7-jdk
# openjdk-7-jre
# openvpn
# pdftk
# pencil
# pepperflashplugin-nonfree
# pinta
# plank-themer
# pm-utils
# poedit
# pv # Durchsatzmessung von Pipes
# remmina
# shutter
# skype 
# smartgithg 
# spotify-client
# sshfs
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
# vlc
# xbindkeys xbindkeys-config xkbset # For keyboard manipulation (e.g. "CapsLock=MidMouse")
#
###############################################################################
START=`date`
echo "Install frequently used software for Ubuntu based Linux Distros"
echo ""
echo "Step 1: Update & upgrade packages"
echo "Step 2: Remove non used packages"
echo "Step 3: Add repos"
echo "Step 4: Install packages"
echo ""
echo "Let's start!"
echo ""
# First we will update the system
echo "Step 1: Update System"
sudo apt-get update
sudo apt-get -y dist-upgrade

# Add all of the additional repositories
echo "Step 2: Add Repos"
echo ""
#sudo apt-add-repository -y ppa:birdie-team/stable
# BitTorrent Sync
echo "Adding BitTorrent Sync"
sudo apt-add-repository -y ppa:tuxpoldo/btsync
# Conky Manager
echo "Adding Conky Manager"
sudo apt-add-repository -y ppa:teejee2008/ppa
# Docker
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9
sudo sh -c "echo deb https://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list"
# Dropbox
echo "Adding Dropbox"
sudo apt-add-repository -y 'deb http://linux.dropbox.com/ubuntu trusty main'
sudo apt-key adv --keyserver pgp.mit.edu --recv-keys 5044912E
# Elementary Tweaks
echo "Adding Elementary Tweaks"
sudo apt-add-repository -y ppa:mpstark/elementary-tweaks-daily
# Go for it
echo "Adding go for it"
sudo apt-add-repository -y ppa:mank319/go-for-it
# Hipchat
echo "Adding Hipchat"
echo "deb http://downloads.hipchat.com/linux/apt stable main" >  /etc/apt/sources.list.d/atlassian-hipchat.list
wget -O - https://www.hipchat.com/keys/hipchat-linux.key | apt-key add -
# Insync
echo "Adding Insync"
wget -qO - https://d2t3ff60b2tol4.cloudfront.net/services@insynchq.com.gpg.key | sudo apt-key add -
sudo echo "#Add Insync Repository" >> /etc/apt/sources.list
sudo echo "deb http://apt.insynchq.com/ubuntu trusty non-free contrib" >> /etc/apt/sources.list
# Plank Themes
sudo add-apt-repository -y ppa:noobslab/apps
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
# echo ""
sudo apt-get update
echo ""
# Let's install the bunch of the new nice <<required>> software
echo "Final Step 3: INSTALLATION"
echo ""
sudo apt-get -y install aptitude autokey-gtk bluefish bluefish-plugins btsync-gui ccrypt chromium-browser chromium-browser-l10n conky conky-all conky-manager dia lxc-docker dconf-editor dropbox elementary-tweaks flashplugin-installer filezilla firefox firefox-locale-de gedit gdebi gimp git gitg go-for-it gparted gsynaptics guake guayadeque hddtemp hipchat imagemagick insync jxplorer keepass2 labyrinth mc meld openjdk-7-jre openjdk-7-jdk openvpn pdftk pencil pepperflashplugin-nonfree pinta plank-themer pm-utils poedit pv remmina shutter skype spotify-client sshfs sublime-text subversion synapse synaptic sysv-rc-conf thunderbird thunderbird-locale-de tomboy transmission vim vlc xbindkeys xbindkeys-config xkbset
# For plank themer
cd /tmp/ && ./Replace.sh;cd
echo ""
sudo dpkg --add-architecture i386
echo "Install Teamviewer"
wget -O ~/Downloads/teamviewer.deb http://www.teamviewer.com/download/teamviewer_linux.deb
sudo gdebi -n ~/Downloads/teamviewer.deb
echo "Install Google Chrome"
wget -O ~/Downloads/googlechrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo gdebi -n ~/Downloads/googlechrome.deb
echo ""

# Let's get rid of unnecessary software packages
echo "Step 4:  remove unnecessary software packages"
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

echo ""
echo "libreoffice"
sudo apt-get -y install libreoffice libreoffice-l10n-de 
echo ""
echo "Have fun!"

END=`date`

echo ""
echo "Start: $START"
echo "Ende: $END"

exit 0
