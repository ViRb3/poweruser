#### Very long Windows start delay
- Disable the `Intel Management Engine` device from `Device Manager`
#### Missing `MSVC---.dll`
- https://support.microsoft.com/en-gb/help/2977003/the-latest-supported-visual-c-downloads
#### Windows Telemetry
- https://github.com/crazy-max/WindowsSpyBlocker
#### High CPU/IO usage by CompatTelRunner
- [disable-telemetry.bat](scripts/disable-telemetry.bat)
#### DPC Latency (sound popping, stutter, lag)
- Disable `NVIDIA Battery Boost` in `NVIDIA GeForce Experience`
- Disable `CD/DVD device` in `Device Manager`
- Faulty SATA controller driver, install `Intel RST` if applicable

Use `LatencyMon` to diagnose faulty drivers
#### 260 character limit in file names and paths
- https://www.howtogeek.com/266621/how-to-make-windows-10-accept-file-paths-over-260-characters/
#### Inability to click certain toolbar items in various programs
- Uninstall `Nahimic` sound processing software
#### Change MAC
- https://technitium.com/tmac/
#### Screen gamma changing when switching between black and white windows
- Disable `Intel (Graphics) Display Power Saving Technology`: [Disable Intel Graphics Gamma.reg](reg/Disable%20Intel%20Graphics%20Gamma.reg)
#### Microphone not working / very low in direct VoIP clients (TeamSpeak, Discord)
- Disable sound effects from `Microphone settings > Enchantments > Disable all sound effects`
- Increase `Microphone Level` to `100`
#### Context menu delay when right-clicking Executable Files (*.exe)
- Disable `NVIDIA Run with graphics processor` context menu entry in `NVIDIA Control Panel`
#### Context menu delay when right-clicking an empty desktop
- Disable `Intel Integrated Graphics` context menu entry (use `ShellExView`)
#### Slow UI animations
- Disable them from `Accessibility`
#### High CPU usage by VMWare Workstation
- Disable `VM Sharing` in program settings
#### USB3 UAS failure in VMWare
- https://superuser.com/questions/1442507/error-usb3-uas-passthrough-vmware-workstation-15
#### Wi-Fi using 2.4GHz band
- Set `Preferred Band` to `5GHz` in `Device Manager > Wi-Fi adapter > Properties > Advanced`
### Group Policies
#### Activity Timeline
- `Group Policy Editor (Computer Config) > Admin Templates > System > OS Policies > Enables Activity Feed`
#### Auto-restart for updates
- `Group Policy Editor > Admin Templates > Windows Components > Windows Update > No auto-restart...`
#### Disable auto-install updates
- `Group Policy Editor > Admin Templates > Windows Ddefender Antivirus > Windows Update > Configure Automatic Updates`
#### Disable Windows Defender
- `Group Policy Editor > Admin Templates > Windows Ddefender Antivirus > Windows Update > Turn off...`
