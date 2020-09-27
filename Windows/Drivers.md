## Drivers

### Generic
   2. #### Screen gamma changing when switching between black and white windows
      - Disable `Intel (Graphics) Display Power Saving Technology` ([dpst-control](https://github.com/orev/dpst-control))

   3. #### Wi-Fi using 2.4GHz band
      - Set `Preferred Band` to `5GHz` in `Device Manager > Wi-Fi adapter > Properties > Advanced`

### Lenovo Legion 7i
   1. #### Command-line interface for Lenovo Diagnostics constantly running and using CPU
      - Run in Administrator Powershell:

         ```powershell
         [microsoft.win32.registry]::SetValue("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\LenovoDiagnosticsCLI.exe", "Debugger", "systray.exe")
         ```

   2. ### External monitor laggy/choppy/low FPS when first connected via cable
      - Restart `Intel Graphics` driver ([intel-graphics-control](scripts/intel-graphics-control/README.md))

   3. ### Lenovo Vantage bloatware
      - Disable it via the [Enterprise Group Policy](Regs/Lenovo%20Vantage/README.md)

   4. Built-in monitor only supports 144/240Hz
      - Use [Custom Resolution Utility](https://www.monitortests.com/forum/Thread-Custom-Resolution-Utility-CRU) to add a new `Detailed resolution` with 60Hz

### MSI GE66 2QD
1. #### Very long Windows start delay
   - Disable the `Intel Management Engine` device from `Device Manager`

2. #### Inability to click certain toolbar items in various programs
   - Uninstall `Nahimic` sound processing software

3. #### Microphone not working / very low in direct VoIP clients (TeamSpeak, Discord)
   - Disable sound effects from `Microphone settings > Enchantments > Disable all sound effects`
   - Increase `Microphone Level` to `100`

4. #### Context menu delay when right-clicking Executable Files (*.exe)
   - Disable `NVIDIA Run with graphics processor` context menu entry in `NVIDIA Control Panel`

5. #### Context menu delay when right-clicking an empty desktop
   - Disable `Intel Integrated Graphics` context menu entry ([ShellExView](https://www.nirsoft.net/utils/shexview.html))

6. #### DPC Latency (sound popping, stutter, lag)
   - Disable `NVIDIA Battery Boost` in `NVIDIA GeForce Experience`
   - Disable `CD/DVD device` in `Device Manager`
   - Faulty SATA controller driver, install `Intel RST` if applicable

   Use `LatencyMon` to diagnose faulty drivers
