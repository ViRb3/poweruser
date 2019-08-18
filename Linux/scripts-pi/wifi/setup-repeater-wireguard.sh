#!/bin/bash
#
# SETUP RASPBERRY PI AS WIFI REPEATER THROUGH WIREGUARD
#

if [ "$EUID" -ne 0 ]; then
    echo "Please run as root"
    exit
fi

sed -i 's/-o wlan0/-o wg/' /etc/systemd/system/wpa_supplicant@wlan0.service.d/override.conf

echo "Setup complete! Reboot for the changes to take effect"
echo "Make sure your WireGuard adapter is called 'wg'."
