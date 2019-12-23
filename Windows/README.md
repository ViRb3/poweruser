## Windows
### Missing `MSVC---.dll`
- https://support.microsoft.com/en-gb/help/2977003/the-latest-supported-visual-c-downloads

### Clean VSS
- As per [backupchain article](http://backupchain.com/i/how-to-delete-all-vss-shadows-and-orphaned-shadows):
    ```powershell
    vssadmin delete shadows /all
    ```
    Then for each drive:
    ```powershell
    vssadmin Resize ShadowStorage /For=C: /On=C: /MaxSize=300MB
    vssadmin Resize ShadowStorage /For=C: /On=C: /MaxSize=UNBOUNDED
    ```

### Windows Telemetry
- https://github.com/crazy-max/WindowsSpyBlocker

### CompatTelRunner (high CPU/IO usage)
- [Disable Telemetry.reg](Regs/Disable&#32;Telemetry.reg)

### Clear PowerShell/CMD console history
- `Alt+F7`

### Slow UI animations
- Disable them from `Accessibility`

### Icon overlays missing
- Windows has a limit of 15 overlays at a time.
- https://superuser.com/questions/1166577/why-does-windows-limit-icon-overlays-to-15

### 260 character limit in file names and paths
- https://www.howtogeek.com/266621/how-to-make-windows-10-accept-file-paths-over-260-characters/