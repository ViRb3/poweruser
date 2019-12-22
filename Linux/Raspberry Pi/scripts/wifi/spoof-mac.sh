#!/bin/bash
#
# Spoof Raspberry Pi MAC address
#

FILE="/etc/systemd/network/25-wlan0.link"

read -p "Interface name (DEFAULT wlan0): " IFACE
IFACE=${IFACE:-wlan0}

read -p "Interface original MAC (xx:xx:xx:xx:xx:xx): " ORIG_MAC
if [[ -z $ORIG_MAC ]]; then
    echo "No input, exiting!"
    exit
fi

read -p "Interface new MAC (xx:xx:xx:xx:xx:xx): " NEW_MAC
if [[ -z $NEW_MAC ]]; then
    echo "No input, exiting!"
    exit
fi

sudo bash -c "cat > $FILE" <<EOF
[Match]
MACAddress=$ORIG_MAC

[Link]
Name=$IFACE
MACAddress=$NEW_MAC
EOF

sudo chmod 0777 $FILE

echo "Done!"
echo "Reboot for changes to take effect."
