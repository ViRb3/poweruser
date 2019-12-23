## Block non-VPN internet traffic

### UFW
```bash
# Default policies
ufw default deny incoming
ufw default deny outgoing
# Openvpn interface
ufw allow in on tun0
ufw allow out on tun0 
# OpenVPN
ufw allow out to any port 1194
ufw allow in from any port 1194
# DNS
ufw allow in from any to any port 53
ufw allow out from any to any port 53
```

### IPTables
```bash
$IPT -F
# policies
$IPT -P OUTPUT DROP                                                    # default policy for outgoing packets
$IPT -P INPUT DROP                                                     # default policy for incoming packets
$IPT -P FORWARD DROP                                                   # default policy for forwarded packets
# allowed outputs
$IPT -A OUTPUT --out-interface lo -j ACCEPT                             # enable localhost
$IPT -A OUTPUT --out-interface tap0 -j ACCEPT                           # enable outputs on OpenVPN interface
$IPT -A OUTPUT -p tcp --dport 1194 -j ACCEPT                            # enable port for establishing VPN
$IPT -A OUTPUT -p udp --dport 1194 -j ACCEPT                            
$IPT -A OUTPUT -p tcp --dport 53 -j ACCEPT                              # enable DNS requests
$IPT -A OUTPUT -p udp --dport 53 -j ACCEPT
# allowed inputs
$IPT -A INPUT --in-interface lo -j ACCEPT                               # enable localhost
$IPT -A INPUT -p icmp -m icmp --icmp-type 8 -j ACCEPT                   # enable ping from other machines
$IPT -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT            # enable requested packets
```