## Raspberry Pi
### Kodi
```bash
apt install kodi kodi-peripheral-joystick ntfs-3g
```

## Measure temp through /sys
```bash
watch echo "$((`cat /sys/class/thermal/thermal_zone0/temp` / 1000))C"
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