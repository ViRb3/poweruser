# Windows Server Setup

1. #### Uninstall Windows Defender

   ```powershell
   Uninstall-WindowsFeature -Name Windows-Defender
   ```

2. #### Install Docker

   ```powershell
   wget "https://download.docker.com/win/stable/Docker%20for%20Windows%20Installer.exe" -o Docker.exe
   ```

3. #### Install AnyDesk
   ```
   wget "https://download.anydesk.com/AnyDesk.exe" -o AnyDesk.exe
   ```
