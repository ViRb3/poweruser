# Linux

## Sub-directories

- [Raspberry Pi](Raspberry%20Pi/)
- [Scripts](scripts/)

## Categories

- [Block Non-VPN Internet](Block%20Non-VPN%20Internet.md)
- [iproute2](iproute2.md)
- [iptables](iptables.md)
- [Security](Security.md)

## General

1. #### Generating strong secret

   ```bash
   openssl rand -hex 16
   ```

2. #### Auto-mount drive

   - `apt install ntfs-3g`
   - `/etc/fstab`:
     ```
     LABEL=foo /mnt/foo ext4 defaults,nofail 0 0
     LABEL=bar /mnt/bar ntfs-3g defaults,nofail 0 0
     ```

3. #### Purge all unused packages

   ```bash
   apt autoremove
   apt purge $(dpkg -l | grep '^rc' | awk '{print $2}')
   ```

4. #### Benchmark a disk

   ```bash
   # Write
   sync; sysctl -w vm.drop_caches=3
   dd if=/dev/zero of=tempfile bs=1M count=1024
   # Read
   sync; sysctl -w vm.drop_caches=3
   dd if=tempfile of=/dev/null bs=1M count=1024
   ```

5. #### Install bash-it with bobby theme

   ```bash
   git clone "https://github.com/Bash-it/bash-it.git" ~/.bash_it
   ~/.bash_it/install.sh
   sed -i -e "s/export BASH_IT_THEME='bobby'/export BASH_IT_THEME='candy'/g" ~/.bashrc
   ```

6. #### Enforce max permissions

   ```bash
   # clear ACL
   setfacl -b "/mnt/drive"

   # set 777 default ACL
   setfacl -R -d -m u::rwx,g::rwx,o::rwx "/mnt/drive"

   chown -R nobody:nogroup "/mnt/drive"

   find "/mnt/drive" -type f -exec chmod 666 -- {} +
   find "/mnt/drive" -type d -exec chmod 777 -- {} +
   find "/mnt/drive" -type d -exec chmod g+s -- {} +
   ```

7. #### WireGuard generate private-public key pair

   ```bash
   wg genkey | tee /dev/tty | wg pubkey
   ```

8. #### Generate self-signed certificate

   ```bash
   openssl genrsa -out ca.key 2048
   openssl req -new -x509 -days 365 -key ca.key -subj "/C=CN/ST=GD/L=SZ/O=Acme, Inc./CN=Acme Root CA" -out ca.crt

   openssl req -newkey rsa:2048 -nodes -keyout server.key -subj "/C=CN/ST=GD/L=SZ/O=Acme, Inc./CN=*.example.com" -out server.csr
   openssl x509 -req -extfile <(printf "subjectAltName=DNS:example.com,DNS:www.example.com") -days 365 -in server.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out server.crt
   ```

9. #### Enable `tmux` mouse mode

   ```bash
   cat "set -g mouse on" > ~/.tmux.conf
   ```

10. #### Auto-login with `lightdm`
    `/etc/lightdm/lightdm.conf.d/autologin.conf`:
    ```ini
    [SeatDefaults]
    autologin-user=user
    autologin-user-timeout=0
    ```
