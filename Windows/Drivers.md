## Drivers
#### Very long Windows start delay
- Disable the `Intel Management Engine` device from `Device Manager`

#### DPC Latency (sound popping, stutter, lag)
- Disable `NVIDIA Battery Boost` in `NVIDIA GeForce Experience`
- Disable `CD/DVD device` in `Device Manager`
- Faulty SATA controller driver, install `Intel RST` if applicable
  
Use `LatencyMon` to diagnose faulty drivers

#### Inability to click certain toolbar items in various programs
- Uninstall `Nahimic` sound processing software

#### Screen gamma changing when switching between black and white windows
- Disable `Intel (Graphics) Display Power Saving Technology`: [Disable Intel Graphics Gamma.reg](reg/Disable%20Intel%20Graphics%20Gamma.reg)

#### Microphone not working / very low in direct VoIP clients (TeamSpeak, Discord)
- Disable sound effects from `Microphone settings > Enchantments > Disable all sound effects`
- Increase `Microphone Level` to `100`

#### Context menu delay when right-clicking Executable Files (*.exe)
- Disable `NVIDIA Run with graphics processor` context menu entry in `NVIDIA Control Panel`

#### Context menu delay when right-clicking an empty desktop
- Disable `Intel Integrated Graphics` context menu entry (use `ShellExView`)

#### Wi-Fi using 2.4GHz band
- Set `Preferred Band` to `5GHz` in `Device Manager > Wi-Fi adapter > Properties > Advanced`