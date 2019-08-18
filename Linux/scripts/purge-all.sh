#!/bin/bash
#
# Purge all unused packages
#

sudo apt autoremove
sudo apt purge $(dpkg -l | grep '^rc' | awk '{print $2}')