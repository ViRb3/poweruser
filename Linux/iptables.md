## iptables

### Packet flow
#### Simplified
```
                               XXXXXXXXXXXXXXXXXX
                             XXX     Network    XXX
                               XXXXXXXXXXXXXXXXXX
                                       +
                                       |
                                       v
 +-------------+              +------------------+
 |table: filter| <---+        | table: nat       |
 |chain: INPUT |     |        | chain: PREROUTING|
 +-----+-------+     |        +--------+---------+
       |             |                 |
       v             |                 v
 [local process]     |           ****************          +--------------+
       |             +---------+ Routing decision +------> |table: filter |
       v                         ****************          |chain: FORWARD|
****************                                           +------+-------+
Routing decision                                                  |
****************                                                  |
       |                                                          |
       v                        ****************                  |
+-------------+       +------>  Routing decision  <---------------+
|table: nat   |       |         ****************
|chain: OUTPUT|       |               +
+-----+-------+       |               |
      |               |               v
      v               |      +-------------------+
+--------------+      |      | table: nat        |
|table: filter | +----+      | chain: POSTROUTING|
|chain: OUTPUT |             +--------+----------+
+--------------+                      |
                                      v
                               XXXXXXXXXXXXXXXXXX
                             XXX    Network     XXX
                               XXXXXXXXXXXXXXXXXX
```

#### Full
![](Netfilter-packet-flow.svg)

### Commands
#### List the rules in a chain or all chains
- `iptables --list`
- `iptables -t nat -L`

#### Print the rules in a chain or all chains
- `iptables --list-rules`
- `iptables -t nat -S`

#### Debugging (tracing)
- `iptables -t raw -A PREROUTING -p tcp -j TRACE`
- `iptables -t raw -A OUTPUT -p icmp -j TRACE`
- `dmesg | grep TRACE`

### Targets
#### DNat (Destination NAT)
> This target is only valid in the nat table, in the `PREROUTING` and `OUTPUT` chains, and user-defined chains which are only called from those chains. It specifies that the destination address of the packet should be modified (and all future packets in this connection will also be mangled), and rules should cease being examined. It takes one type of option:
- `--to-destination ipaddr[-ipaddr][:port-port]`

#### SNAT
> This target is only valid in the nat table, in the `POSTROUTING` chain. It specifies that the source address of the packet should be modified (and all future packets in this connection will also be mangled), and rules should cease being examined. It takes one type of option:
- `--to-source ipaddr[-ipaddr][:port-port]` 

#### MASQUERADE
> This target is only valid in the nat table, in the `POSTROUTING` chain. It should only be used with dynamically assigned IP (dialup) connections: if you have a static IP address, you should use the SNAT target. Masquerading is equivalent to specifying a mapping to the IP address of the interface the packet is going out, but also has the effect that connections are forgotten when the interface goes down. This is the correct behavior when the next dialup is unlikely to have the same interface address (and hence any established connections are lost anyway). It takes one option:
- `--to-ports port[-port]`

### Logging
- `iptables -A INPUT -p tcp -j LOG --log-level 1 --log-prefix "[prefix] "`

#### Containers
> Iptables `LOG` rules inside containers are suppressed by default. You can run ulogd in each container and use iptables `NFLOG` (or ULOG) rules instead of `LOG` rules. As of kernel 4.11, you can change this behavior on the host:
- `echo 1 > /proc/sys/net/netfilter/nf_log_all_netns`

### Resources
- https://wiki.archlinux.org/index.php/Iptables
- https://gist.github.com/mcastelino/c38e71eb0809d1427a6650d843c42ac2
- https://commons.wikimedia.org/wiki/File:Netfilter-packet-flow.svg
- http://www.adminsehow.com/2011/09/iptables-packet-traverse-map/
- https://backreference.org/2010/06/11/iptables-debugging/