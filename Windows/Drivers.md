# Drivers

## Generic

1. #### Screen gamma changing when switching between black and white windows
   - Disable `Intel (Graphics) Display Power Saving Technology` ([dpst-control](https://github.com/orev/dpst-control))
2. #### Wi-Fi using 2.4GHz band
   - Set `Preferred Band` to `5GHz` in `Device Manager > Wi-Fi adapter > Properties > Advanced`
3. #### Context menu delay when right-clicking Executable Files (\*.exe)
   - Disable `NvAppShExt Class` (NVIDIA Shell Extensions) context menu entry ([ShellExView](https://www.nirsoft.net/utils/shexview.html))

## Lenovo Legion 7i

1. #### External monitor laggy/choppy/low FPS when first connected via cable
   - Restart `Intel Graphics` driver ([intel-graphics-control](scripts/intel-graphics-control/README.md))
2. #### Lenovo Vantage bloatware
   - Uninstall "Lenovo Vantage" and "LenovoVantageService"
   - Clean up with [CleanupLenovoVantage.ps1](scripts/CleanupLenovoVantage.ps1)
   - Use [LenovoController](https://github.com/ViRb3/LenovoController)
3. #### Constantly running process `LenovoUtilityService.exe`
   - Comes from `Lenovo Fn and function keys` driver
   - Disable using Powershell:
     ```powershell
     [microsoft.win32.registry]::SetValue("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\LenovoUtilityService.exe", "Debugger", "systray.exe")
     ```
4. #### Built-in monitor only supports 144/240Hz
   - Use [Custom Resolution Utility](https://www.monitortests.com/forum/Thread-Custom-Resolution-Utility-CRU) to add a new `Detailed resolution` with 60Hz
5. #### Disable mouse/keyboard waking up computer from sleep
   - In `Device Manager`, for each entry under `Keyboards` and `Mice and other pointing devices`, go to `Power Management` > untick `Allow this device to wake up the computer`

## MSI GE62 2QD

1. #### Very long Windows start delay
   - Disable the `Intel Management Engine` device from `Device Manager`
2. #### Inability to click certain toolbar items in various programs
   - Uninstall `Nahimic` sound processing software
3. #### Microphone not working / very low in direct VoIP clients (TeamSpeak, Discord)
   - Disable sound effects from `Microphone settings > Enchantments > Disable all sound effects`
   - Increase `Microphone Level` to `100`
4. #### Context menu delay when right-clicking an empty desktop
   - Disable `Intel Integrated Graphics` context menu entry ([ShellExView](https://www.nirsoft.net/utils/shexview.html))
5. #### DPC Latency (sound popping, stutter, lag)
   - Disable `NVIDIA Battery Boost` in `NVIDIA GeForce Experience`
   - Disable `CD/DVD device` in `Device Manager`
   - Faulty SATA controller driver, install `Intel RST` if applicable
   - Use `LatencyMon` to diagnose faulty drivers
6. #### Multi-monitor maximized window blank/empty space on top of screen
   - `Control Panel` > `Intel HD Graphics` > `Display` > `Scaling` > `Scale Full Screen`. Also enable `Override Application Settings`. _[[source](https://answers.microsoft.com/en-us/windows/forum/all/windows-10-multi-monitor-maximized-window/3c2042ef-73df-401c-9a59-65b347d4dbea)]_
