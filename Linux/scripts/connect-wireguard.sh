#!/bin/bash
#
# Create wireguard client profile and connect
#

SERVER_PUB_KEY='123'
SERVER_ENDPOINT="456:7000"
IFACE_NAME="wg0-client"

read -p "Virtual IP (DEFAULT 10.8.0.101): " VIRT_IP
VIRT_IP=${VIRT_IP:-"10.8.0.101"}

PRIV_KEY="$(wg genkey)"
PUB_KEY="$(echo $PRIV_KEY | wg pubkey)"

sudo bash -c "cat > /etc/wireguard/$IFACE_NAME.conf" <<EOF
[Interface]
Address = $VIRT_IP/32
PrivateKey = $PRIV_KEY

[Peer]
PublicKey = $SERVER_PUB_KEY
Endpoint = $SERVER_ENDPOINT
AllowedIPs = 10.8.0.1/24
PersistentKeepalive = 21
EOF

sudo chmod o-rwx "/etc/wireguard/$IFACE_NAME.conf"

# just in case
sudo systemctl stop wg-quick@$IFACE_NAME
sudo wg-quick down $IFACE_NAME

sudo systemctl start wg-quick@$IFACE_NAME
sudo systemctl enable wg-quick@$IFACE_NAME

echo
echo "=========================================================="
echo " IMPORTANT"
echo "=========================================================="
echo "This client's public key, write to server config:"
echo $PUB_KEY
echo