## Applications

1. ### VMWare
    #### High CPU usage by VMWare Workstation
    - Disable `VM Sharing` in program settings
    #### USB3 UAS failure in VMWare
    1. Shut down the VM
    2. Append to the `.vmx` file of the VM:
    ```
    usb.generic.keepStreamsEnabled = "FALSE"
    ```
    3. Make sure `USB 3.0` compatibility mode is selected in the VM USB settings
    - [More information](https://superuser.com/questions/1442507/error-usb3-uas-passthrough-vmware-workstation-15)

2. ### AdGuard
    #### Filtering does not work on all websites
    - Certain browsers (such as Firefox) will pin the original certificate if connecting without AdGuard, preventing AdGuard from working in the future
    - Delete all history and cache to clean such records

3. ### Windows Defender
    To permanently disable Defender after the [August 2020 update](https://www.bleepingcomputer.com/news/microsoft/microsoft-confirms-why-windows-defender-can-t-be-disabled-via-registry/):
    - In an Administrator Powershell window, run:
        ```powershell
        (65..(65+25)).ForEach({ Add-MpPreference -ExclusionPath  "$([char]$_):\" })
        ```
        To revert:
        ```powershell
        (65..(65+25)).ForEach({ Remove-MpPreference -ExclusionPath  "$([char]$_):\" })
        ```
    OR

    - In an Administrator Command prompt window, run:
        ```cmd
        mklink "C:\ProgramData\Microsoft\Windows Defender:omgwtfbbq" "\??\NUL"
        ```
        To revert: 
        ```cmd
        fsutil reparsepoint delete C:\ProgramData\Microsoft\Windows Defender
        ```
        [_(Source)_](https://twitter.com/jonasLyk/status/1293815234805760000)
