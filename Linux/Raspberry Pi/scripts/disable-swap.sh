#!/bin/bash
#
# Disables swap file
#

dphys-swapfile uninstall
sed -i -E 's/^[\t ]*#?[\t ]*CONF_SWAPSIZE=.*/CONF_SWAPSIZE=0/gm' /etc/dphys-swapfile
echo "Done!"
echo "You should probably reboot now"

# sudo systemctl disable dphys-swapfile.service

# sudo dphys-swapfile swapoff && \
#     sudo dphys-swapfile uninstall && \
#     sudo update-rc.d dphys-swapfile remove
