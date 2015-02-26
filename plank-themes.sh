#!/bin/bash

sudo add-apt-repository -y ppa:noobslab/apps
sudo apt-get update
sudo apt-get install -y plank-themer
cd /tmp/ && ./Replace.sh;cd

exit 0
