#!/bin/bash
#
# <mazienho@gmx.de> 
# install-script for elementary os
# v.0.2 :  2014-10-10 - added package lists in first lines
# v.0.1 :  2014-08-26 - initial version of the script
#
###############################################################################
# + + + + + List of installed packages to remove
# geary
# midori-granite
# noise
# software-center
# scratch-text-editor
#
###############################################################################
# + + + + + List of packages to install + + + + + +
# anjuta
# aptitude
# autokey-gtk
# birdie
# bluefish bluefish-plugins
# btsync-gui
# ccrypt
# chromium-browser chromium-browser-l10n
# conky conky-all conky-manager
# dconf-editor
# docker.io
# evolution evolution-ews
# firefox firefox-locale-de
# gedit
# git
# gitg
# gparted
# grive
# gsynaptics
# guake
# guayadeque
# hddtemp
# libreoffice libreoffice-l10n-de
# meld
# pdftk
# pepperflashplugin-nonfree
# pinta
# shutter
# skype 
# spotify-client
# sublime-text
# synapse
# synaptic
# sysv-rc-conf
# thunderbird thunderbird-locale-de
# tomboy
# transmission
# vim
# vlc
# xbindkeys xbindkeys-config xkbset
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

# Let's get rid of unnecessary software packages
echo "Step 2:  remove not used packages"
sudo apt-get purge midori-granite
sudo apt-get purge noise
sudo apt-get purge geary 
sudo apt-get purge software-center
sudo apt-get purge scratch-text-editor
sudo apt-get autoremove
sudo apt-get autoclean
echo ""

# Add all of the additional repositories
echo "Step 3: Add Repos"
echo ""

# Conky Manager
echo "Adding Conky Manager"
sudo apt-add-repository -y ppa:teejee2008/ppa
# BitTorrent Sync
echo "Adding BitTorrent Sync"
sudo apt-add-repository -y ppa:tuxpoldo/btsync 
# Synapse - testing // no errors occured until now
echo "Adding Synapse"
sudo apt-add-repository -y ppa:synapse-core/testing
# Spotify
echo "Adding Spotify"
sudo apt-add-repository -y 'deb http://repository.spotify.com/ stable non-free' 
sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 94558F59
# Sublime text editor
echo "Adding Sublime Text Editor"
sudo apt-add-repository -y ppa:webupd8team/sublime-text-2
# Birdie - Twitter client
echo "Adding Birdie - Twitter Client"
sudo apt-add-repository -y ppa:birdie-team/stable
# Skype
echo "Adding Skype"
sudo apt-add-repository -y 'deb http://archive.canonical.com/ubuntu/ trusty partner'
sudo apt-add-repository -y 'deb-src http://archive.canonical.com/ubuntu/ trusty partner'
sudo apt-get update
echo ""
 
# Let's install the bunch of the new nice <<required>> software
echo "Final Step 4: INSTALLATION"
echo ""
sudo apt-get -y install anjuta aptitude autokey-gtk birdie bluefish bluefish-plugins btsync-gui ccrypt chromium-browser chromium-browser-l10n conky conky-all conky-manager dconf-editor docker.io evolution evolution-ews firefox firefox-locale-de gedit git gitg gparted grive gsynaptics guake guayadeque hddtemp libreoffice libreoffice-l10n-de meld pdftk pepperflashplugin-nonfree pinta shutter skype spotify-client sublime-text synapse synaptic sysv-rc-conf thunderbird thunderbird-locale-de tomboy transmission vim vlc xbindkeys xbindkeys-config xkbset
echo ""
echo "Have fun!"

END=`date`

echo ""
echo "Start: $START"
echo "Ende: $END"

exit 0
