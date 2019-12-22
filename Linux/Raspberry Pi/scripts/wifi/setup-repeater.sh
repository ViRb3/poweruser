#!/bin/bash
#
# SETUP RASPBERRY PI AS WIFI REPEATER
#
# Full tutorial:
# https://raspberrypi.stackexchange.com/questions/89803/access-point-as-wifi-repeater-optional-with-bridge
#
# Notes:
# - wlan0 and ap0 must be running on same channel
#

if [ "$EUID" -ne 0 ]; then
    echo "Please run as root"
    exit
fi

echo "Beginning setup..."

# install rng-tools
apt install rng-tools -y

# install hostapd and enable it
apt install hostapd -y
systemctl unmask hostapd
systemctl enable hostapd

# disable debian networking and dhcpcd
systemctl mask networking.service
systemctl mask dhcpcd.service
mv /etc/network/interfaces /etc/network/interfaces~
sed -i '1i resolvconf=NO' /etc/resolvconf.conf

# enable systemd-networkd
systemctl enable systemd-networkd.service
systemctl enable systemd-resolved.service
ln -sf /run/systemd/resolve/resolv.conf /etc/resolv.conf

# setup the access point
cat > /etc/hostapd/hostapd.conf <<EOF
interface=ap0
driver=nl80211
ssid=WIFI_SSID
country_code=GB
hw_mode=g
channel=1
wmm_enabled=0
auth_algs=1
wpa=2
wpa_passphrase=WIFI_PASSWORD
wpa_key_mgmt=WPA-PSK
wpa_pairwise=TKIP
rsn_pairwise=CCMP
EOF
chmod 600 /etc/hostapd/hostapd.conf

# set DAEMON_CONF
sed -i 's/^#DAEMON_CONF=.*$/DAEMON_CONF="\/etc\/hostapd\/hostapd.conf"/' /etc/default/hostapd

# disable hostapd after network target
sed -i 's/^After=network.target$/#After=network.target/' /lib/systemd/system/hostapd.service

# add interface ap0 to the hostapd.service
mkdir -p "/etc/systemd/system/hostapd.service.d/"
cat > "/etc/systemd/system/hostapd.service.d/override.conf" <<EOF
[Unit]
Wants=wpa_supplicant@wlan0.service

[Service]
Type=simple
ExecStartPre=/sbin/iw dev wlan0 interface add ap0 type __ap
ExecStartPost=/sbin/iw dev wlan0 set power_save off
ExecStartPost=/sbin/iw dev ap0 set power_save off
ExecStopPost=-/sbin/iw dev ap0 del
EOF

# setup wpa_supplicant for client connection
mv /etc/wpa_supplicant/wpa_supplicant.conf /etc/wpa_supplicant/wpa_supplicant-wlan0.conf
systemctl disable wpa_supplicant.service
systemctl enable wpa_supplicant@wlan0.service

# link wpa_supplicant with hostapd
mkdir -p "/etc/systemd/system/wpa_supplicant@wlan0.service.d/"
cat > "/etc/systemd/system/wpa_supplicant@wlan0.service.d/override.conf" <<EOF
[Unit]
BindsTo=hostapd.service
After=hostapd.service

[Service]
ExecStartPost=/sbin/iptables -t nat -A POSTROUTING -o wlan0 -j MASQUERADE
ExecStopPost=-/sbin/iptables -t nat -D POSTROUTING -o wlan0 -j MASQUERADE
EOF

# setup WLAN
cat > /etc/systemd/network/08-wlan0.network <<EOF
[Match]
Name=wlan0
[Network]
IPForward=yes
# If you need a static ip address toggle commenting next three lines (example)
DHCP=yes
#Address=192.168.10.60/24
#Gateway=192.168.10.1
# Optional: if you want to connect to your own DNS server, set it here (example)
#DNS=192.168.10.10 8.8.8.8
EOF

# setup AP
cat > /etc/systemd/network/12-ap0.network <<EOF
[Match]
Name=ap0
[Network]
Address=192.168.4.1/24
DHCPServer=yes
[DHCPServer]
DNS=1.1.1.1 1.0.0.1
EOF

# update changes
systemctl daemon-reload

# in case ufw is enabled
if [ -x "$(command -v ufw)" ]; then
    echo "UFW detected! Setting ALLOW forward and ALLOW 67/udp (DHCP)"
    ufw default allow forward
    ufw allow 67/udp comment "DHCP"
fi

echo "Setup complete! Reboot for the changes to take effect"
