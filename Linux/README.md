## Linux
### Auto-mount drive
- `apt install ntfs-3g`
- `/etc/fstab`:
```
LABEL=foo /mnt/foo ext4 defaults,nofail 0 0
LABEL=bar /mnt/bar ntfs-3g defaults,nofail 0 0
```

### Purge all unused packages
```bash
apt autoremove
apt purge $(dpkg -l | grep '^rc' | awk '{print $2}')
```

### Benchmark a disk
```bash
# Write
sync; sysctl -w vm.drop_caches=3
dd if=/dev/zero of=tempfile bs=1M count=1024
# Read
sync; sysctl -w vm.drop_caches=3
dd if=tempfile of=/dev/null bs=1M count=1024
```

### Fix git permissions
```bash
find . -name "*.sh" -exec git add --chmod=+x {} +
```

### Install bash-it with bobby theme
```bash
git clone "https://github.com/Bash-it/bash-it.git" ~/.bash_it
~/.bash_it/install.sh
sed -i -e "s/export BASH_IT_THEME='bobby'/export BASH_IT_THEME='candy'/g" ~/.bashrc
```

### Enforce max permissions
```bash
# clear ACL
# setfacl -bn "/mnt/drive"

# set 777 default ACL
setfacl -R -d -m u::rwx,g::rwx,o::rwx "/mnt/drive"

chown -R nobody:nogroup "/mnt/drive"

find "/mnt/drive" -type f -exec chmod 666 {} \;
find "/mnt/drive" -type d -exec chmod 777 {} \;
find "/mnt/drive" -type d -exec chmod g+s {} \;
```

### WireGuard generate private-public key pair
```bash
wg genkey | tee /dev/tty | wg pubkey
```