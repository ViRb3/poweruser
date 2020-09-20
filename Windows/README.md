# Windows

## Sub-directories
- [Registry keys](Regs/)
- [Scripts](scripts/)

## Categories
- [Applications](Applications.md)
- [Drivers](Drivers.md)
- [Security](Security.md)
- [Group Policies](Group%20Policies.md)
- [Useful Applications](Useful%20Applications.md)
- [Virtual Machine Setup](https://github.com/ViRb3/windows-vm-ansible)
- [Windows Server Setup](Windows%20Server%20Setup.md)

## General

1. ### Missing `MSVC---.dll`
   - https://support.microsoft.com/en-gb/help/2977003/the-latest-supported-visual-c-downloads

2. ### Clean VSS
   - As per [backupchain article](http://backupchain.com/i/how-to-delete-all-vss-shadows-and-orphaned-shadows):
       ```powershell
       vssadmin delete shadows /all
       ```
       Then for each drive:
       ```powershell
       vssadmin Resize ShadowStorage /For=C: /On=C: /MaxSize=320MB
       vssadmin Resize ShadowStorage /For=C: /On=C: /MaxSize=UNBOUNDED
       ```

3. ### Windows Telemetry
   - https://github.com/crazy-max/WindowsSpyBlocker

4. ### CompatTelRunner (high CPU/IO usage)
   - [Disable Telemetry.reg](Regs/Disable%20CompatTelRunner.reg)

5. ### Clear PowerShell/CMD console history
   - `Alt+F7`
   - `rm (Get-PSReadlineOption).HistorySavePath`

6. ### Slow UI animations
   - Disable them from `Ease of Access`

7. ### Icon overlays missing
   - Windows has a limit of 15 overlays at a time.
   - https://superuser.com/questions/1166577/why-does-windows-limit-icon-overlays-to-15

8. ### 260 character limit in file names and paths
   - https://www.howtogeek.com/266621/how-to-make-windows-10-accept-file-paths-over-260-characters/

9. ### Multi-monitor maximized window blank/empty space on top of screen
   -  `Control Panel` > `Intel HD Graphics` > `Display` > `Scaling` > `Scale Full Screen`. Also enable `Override Application Settings`. _[[source](https://answers.microsoft.com/en-us/windows/forum/all/windows-10-multi-monitor-maximized-window/3c2042ef-73df-401c-9a59-65b347d4dbea)]_

10. ### Root certificate validation
    - Using [Sigcheck](https://docs.microsoft.com/en-us/sysinternals/downloads/sigcheck):
        ```powershell
        sigcheck -tv
        ```
