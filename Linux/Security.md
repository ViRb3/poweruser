## Security

1. ### fail2ban

   ```sh
   apt install fail2ban
   ```

2. ### ufw

   ```sh
   apt install ufw
   ufw allow ssh
   ufw enable
   ```

3. ### Disable password

   ```sh
   passwd -dl [ACCOUNT]
   ```

4. ### Disable account

   > :warning: This will disable SSH access

   ```sh
   passwd -edl [ACCOUNT]
   ```

5. ### sshd_config

   ```conf
   PasswordAuthentication no
   ChallengeResponseAuthentication no

   PermitRootLogin prohibit-password
   ```

6. ### Delete shell history on exit

   - `apt install secure-delete`
   - `~/.bash_logout`:

   ```bash
   srm ~/.bash_history 2> /dev/null
   # will prevent saving buffer to ~/.bash_history
   history -c
   ```

7. ### No logging

   #### dmesg: `/etc/sysctl.conf `

   ```conf
   # Uncomment the following to stop low-level messages on console
   kernel.printk = 3 4 1 3
   ```

   ```bash
   dmegs -c
   ```

   #### syslog

   ```bash
   systemctl stop rsyslog
   systemctl disable rsyslog
   srm -dr /var/log/*
   ```

   #### Docker

   ```yaml
   logging:
     driver: syslog
   ```

8. ### Docker + ufw

   Docker [modifies](https://docs.docker.com/network/iptables/) iptables to open mapped ports to the world (`eth0 -> br-*`). This will **bypass** ufw, even if explicitly denied from ufw. Additionally, this setup does not cover other containers trying to reach the host (`br-* -> eth0`), or `network_mode=host` containers. For best security and compatibility, apply the following configuration to delegate all control to ufw. Inspired by [this](https://p1ngouin.com/posts/how-to-manage-iptables-rules-with-ufw-and-docker) guide.

   #### /etc/ufw/before.init

   ufw will flush its own chains, such as `ufw-user-input`, on every reload, but not custom chains, such as `DOCKER-USER`. This means that if the custom chain references ufw's chain, as in the rules below, flusuhing will fail, and ufw will crash with cryptic errors. To prevent this, we manually flush the custom chain in the `before.init` file. Insert the iptables rule like below:

   ```bash
   ...
   stop)
      iptables -F DOCKER-USER || true
      # typically required
      ;;
   ...
   ```

   Make sure to `chmod +x` the file or it will not get executed!

   #### /etc/ufw/after.rules

   Append at the end of the file:

   ```bash
   # DOCKER + UFW
   *filter
   :DOCKER-USER - [0:0]
   :ufw-user-input - [0:0]
   :ufw-after-logging-forward - [0:0]

   -A DOCKER-USER -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
   -A DOCKER-USER -m conntrack --ctstate INVALID -j DROP

   -A DOCKER-USER -s 10.0.0.0/8 -j ACCEPT
   -A DOCKER-USER -s 172.16.0.0/12 -j ACCEPT
   -A DOCKER-USER -s 192.168.0.0/16 -j ACCEPT

   -A DOCKER-USER -j ufw-user-input

   -A DOCKER-USER -j ufw-after-logging-forward
   -A DOCKER-USER -j DROP

   COMMIT
   ```

   Now, you can simply `ufw allow` any port and it will be allowed to enter the host and any Docker container. Otherwise, it will be dropped.

9. ### [Avoid browser fingerprinting](https://github.com/ViRb3/poweruser/blob/master/Windows/Security.md#avoid-browser-fingerprinting)
