## iproute2
> iproute2 is a collection of userspace utilities for controlling and monitoring various aspects of networking in the Linux kernel, including routing, network interfaces, tunnels, traffic control, and network-related device drivers.

### Routing basics
> The routing table is used in order of most specific to least specific

> Linux has multiple routing tables, and when which routing table is used is dependent on a number of rules
- `ip rule show`
```
0:  from all lookup local 
32766:  from all lookup main 
32767:  from all lookup default
```
- `ip route show table local`
> Special routing table containing high priority control routes for local and broadcast addresses
```
broadcast 127.0.0.0 dev lo  proto kernel  scope link  src 127.0.0.1 
local 127.0.0.0/8 dev lo  proto kernel  scope host  src 127.0.0.1 
local 127.0.0.1 dev lo  proto kernel  scope host  src 127.0.0.1 
broadcast 127.255.255.255 dev lo  proto kernel  scope link  src 127.0.0.1 
broadcast 192.168.0.0 dev eth0  proto kernel  scope link  src 192.168.1.27 
local 192.168.1.27 dev eth0  proto kernel  scope host  src 192.168.1.27 
broadcast 192.168.1.255 dev eth0  proto kernel  scope link  src 192.168.1.27 
```
- `ip route show table main`
> Normal routing table containing all non-policy routes. This is also the table you get to see if you simply execute ip route show
```
default via 192.168.1.254 dev eth0 
192.168.0.0/23 dev eth0  proto kernel  scope link  src 192.168.1.27 
```
- `ip route show table default`
> Empty and reserved for post-processing if previous default rules did not select the packet
```
```

### Add IP address to eth0 interface
- `ip addr add 192.0.2.11/24 dev eth0`

### Add default route
- `ip route add default via 192.0.2.1`

### Add routing table
- `ip rule add from 10.193.0.0/16 table 200`
- `ip route add default via 10.192.122.2 table 200`

### Rule priority
```bash
ip rule add pref 32000 from all lookup main
ip rule del pref 32766 from all lookup main
ip rule add pref 32010 from all lookup upstream01
ip rule add pref 32020 from all lookup upstream02
```

### Getting routes
- `ip -s route get 127.0.0.1/32`

### Resources
- https://unix.stackexchange.com/questions/188584/which-order-is-the-route-table-analyzed-in
- https://unix.stackexchange.com/questions/424314/changing-default-ip-rule-priority-for-main-table
- https://nbsoftsolutions.com/blog/routing-select-docker-containers-through-wireguard-vpn
- http://linux-ip.net/html/tools-ip-route.html
- https://wiki.gentoo.org/wiki/Iproute2
- https://access.redhat.com/sites/default/files/attachments/rh_ip_command_cheatsheet_1214_jcs_print.pdf

### Further reading
- https://blog.scottlowe.org/2013/05/29/a-quick-introduction-to-linux-policy-routing/
- https://blog.scottlowe.org/2013/09/04/introducing-linux-network-namespaces/
- https://developers.redhat.com/blog/2018/10/22/introduction-to-linux-interfaces-for-virtual-networking/
- https://superuser.com/questions/764986/howto-setup-a-veth-virtual-network/765078
- https://www.wireguard.com/netns/