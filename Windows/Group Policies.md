## Group Policies
`Local Group Policy Editor\Computer Configuration\Admin Templates\Windows Components`

1. ### Windows Update
   - Windows Update
    - `No auto-restart with logged on users for scheduled automatic updates installations`
    - `Configure Automatic Updates`
      - 2 - Notify for download and auto install

2. ### Allow BitLocker without TPM
   - BitLocker Drive Encryption
    - Operating System Drives
      - `Require additional authentication at startup`
        - Allow BitLocker without a compatible TPM
        - Do not allow TPM

3. ### Disable hardware-based drive encryption
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
