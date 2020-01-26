## Security

### fail2ban
```sh
apt install fail2ban
```

### ufw
```sh
apt install ufw
ufw allow ssh
ufw enable
```

### Disable password
```sh
passwd -dl [ACCOUNT]
```

### Disable account
> :warning: This will disable SSH access
```sh
passwd -edl [ACCOUNT]
```

### sshd_config
```conf
PasswordAuthentication no
ChallengeResponseAuthentication no

PermitRootLogin prohibit-password
```

### Delete shell history on exit
- `apt install secure-delete`
- `~/.bash_logout`:
```bash
srm ~/.bash_history 2> /dev/null
# will prevent saving buffer to ~/.bash_history
history -c
```

### No logging
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