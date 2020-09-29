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

1. #### Missing `MSVC---.dll`

   - https://support.microsoft.com/en-gb/help/2977003/the-latest-supported-visual-c-downloads

2. #### Clean VSS

   - As per [backupchain article](http://backupchain.com/i/how-to-delete-all-vss-shadows-and-orphaned-shadows):
     ```powershell
     vssadmin delete shadows /all
     ```
     Then for each drive:
     ```powershell
     vssadmin Resize ShadowStorage /For=C: /On=C: /MaxSize=320MB
     vssadmin Resize ShadowStorage /For=C: /On=C: /MaxSize=UNBOUNDED
     ```

3. #### Windows Telemetry

   - https://github.com/crazy-max/WindowsSpyBlocker

4. #### CompatTelRunner (high CPU/IO usage)

   - [Disable Telemetry.reg](Regs/Disable%20CompatTelRunner.reg)

5. #### Clear PowerShell/CMD console history

   - `Alt+F7`
   - `rm (Get-PSReadlineOption).HistorySavePath`

6. #### Icon overlays missing

   - Windows has a limit of 15 overlays at a time.
   - https://superuser.com/questions/1166577/why-does-windows-limit-icon-overlays-to-15

7. #### 260 character limit in file names and paths

   - https://www.howtogeek.com/266621/how-to-make-windows-10-accept-file-paths-over-260-characters/
