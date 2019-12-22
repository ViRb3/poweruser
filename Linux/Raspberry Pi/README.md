## Raspberry Pi
### Kodi
```bash
apt install kodi kodi-peripheral-joystick ntfs-3g
```

## Stress test 
```bash
apt install stress sysbench
# sysbench ...
```
```bash
wget "https://raw.githubusercontent.com/ssvb/cpuburn-arm/master/cpuburn-a53.S"
gcc -o cpuburn-a53 cpuburn-a53.S
rm cpuburn-a53.S
# ./cpuburn-a53 ...
```