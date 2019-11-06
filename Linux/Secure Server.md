## Secure server

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

```sh
passwd -edl [ACCOUNT]
```

### sshd_config

```conf
PasswordAuthentication no
ChallengeResponseAuthentication no

PermitRootLogin prohibit-password
```
