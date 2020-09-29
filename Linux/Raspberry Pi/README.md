## Raspberry Pi

## Sub-directories

- [Scripts](scripts/)

## Categories

- [Pi3 Tweak](PI3%20Tweak.md)
- [Pi3B+ Tweak](PI3B+%20Tweak.md)

## General

1. #### Kodi

   ```bash
   apt install kodi kodi-peripheral-joystick ntfs-3g
   ```

2. #### Measure temp through /sys

   ```bash
   watch echo "$((`cat /sys/class/thermal/thermal_zone0/temp` / 1000))C"
   ```

3. #### Stress test
   - sysbench
     ```bash
     apt install stress sysbench
     # sysbench ...
     ```
   - cpuburn
     ```bash
     wget "https://raw.githubusercontent.com/ssvb/cpuburn-arm/master/cpuburn-a53.S"
     gcc -o cpuburn-a53 cpuburn-a53.S
     rm cpuburn-a53.S
     # ./cpuburn-a53 ...
     ```
