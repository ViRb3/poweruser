## Security

1. #### Disable TPM to use password-mode BitLocker encryption

   Refer to BIOS manual

2. #### Disable hardware-based drive encryption

   [Prior to Windows 10 1709](https://hexus.net/tech/news/software/135266-microsoft-stops-trusting-ssd-maker-hardware-encryption/), BitLocker will offload encryption to supported hard drives. Unfortunately, [some of them](https://discordapp.com/channels/517246314346709012/685963469862076540/752689362113921114) implement fake or flawed crypto, which defeats the purpose of BitLocker.

   To check existing drives' encryption method, run:

   ```cmd
   manage-bde.exe -status
   ```

   To disable hardware encryption:

   - BitLocker Drive Encryption
   - Fixed Data Drives, Operating System Drives, Removable Data Drives
     - `Configure use of hardware-based encryption of ...`
     - Disabled

   Or, decrypt the drive, then run:

   ```powershell
   Enable-BitLocker -HardwareEncryption:$False
   ```

   [_(Source)_](https://winaero.com/blog/disable-hardware-bitlocker-encryption/)

3. #### Enable hibernation and replace sleep with hibernation

   `Control Panel` > `Power Options` > `Choose what the power buttons do`

4. #### Enable auto-lock
   `Search` > `Change screen saver` > `On resume, display logon screen`
