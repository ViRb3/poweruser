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
