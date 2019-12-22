#!/bin/bash
#
# Keepalive WiFi, workaround for unexpected bugs
#

echo "Wifi keepalive starting..."
sleep 30
echo "Wifi keepalive started!"
while [ true ]; do
    sleep 5
    ping -c 1 -W 3 8.8.8.8 > /dev/null
    if [ $? != 0 ]; then
        echo "Wifi dead! Rebooting..."
        systemctl restart wpa_supplicant@wlan0
        sleep 30
    fi
done
