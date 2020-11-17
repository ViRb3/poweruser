# Security

1. #### Disable TPM and use password-mode BitLocker encryption

   1. Refer to BIOS manual to disable TPM chip
   2. Set the following `Group Policy`:
      - BitLocker Drive Encryption
      - Operating System Drives
        - `Require additional authentication at startup`
          - Enabled
          - `Allow BitLocker without a compatible TPM ...`
          - Configure TPM Startup
            - `Do not allow TPM`

2. #### Ensure no hardware-based drive encryption

   [Prior to Windows 10 1709](https://hexus.net/tech/news/software/135266-microsoft-stops-trusting-ssd-maker-hardware-encryption/), BitLocker will offload encryption to supported hard drives. Unfortunately, [some of them](https://discordapp.com/channels/517246314346709012/685963469862076540/752689362113921114) implement fake or flawed crypto, which defeats the purpose of BitLocker.

   To check existing drives' encryption method, run:

   ```cmd
   manage-bde.exe -status
   ```

   To disable hardware encryption, set the following `Group Policy`:

   - BitLocker Drive Encryption
   - Fixed Data Drives, Operating System Drives, Removable Data Drives
     - `Configure use of hardware-based encryption of ...`
       - Disabled

   Or alternatively, decrypt the drive, then run:

   ```powershell
   Enable-BitLocker -HardwareEncryption:$False
   ```

   [_(Source)_](https://winaero.com/blog/disable-hardware-bitlocker-encryption/)

3. #### Enable hibernation and replace sleep with hibernation

   `Control Panel` > `Power Options` > `Choose what the power buttons do`

4. #### Enable auto-lock

   `Search` > `Change screen saver` > `On resume, display logon screen`

5. #### Root certificate validation

   - Using [Sigcheck](https://docs.microsoft.com/en-us/sysinternals/downloads/sigcheck):
     ```powershell
     sigcheck -tv
     ```

6. #### Avoid browser fingerprinting

   - Use [Brave browser](https://brave.com/) with `Fingerprinting blocking` set to `Strict`
   - Use [Tor browser](https://www.torproject.org/) without the Tor network:
     - Set environment variable `TOR_SKIP_LAUNCH=1`
     - Open the URL `about:config`, then set `network.dns.disabled=false`
   - To verify:
     - https://panopticlick.eff.org/
     - https://amiunique.org/

7. #### Avoid ZoneID URL leak

   Every major browser, when downloading an executable, will permanently inject the download URL to the file's alternate stream `Zone.Identifier` (all platforms).

   - To view if a file has a ZoneID on Windows, in Powershell run:
     ```powershell
     cat file.exe -stream zone.identifier
     ```
   - To clear the ZoneID in Windows:
     - In Powershell run:
       ```powershell
       Unblock-File file.exe
       ```
     - `Right-click` on the file > `Properties` > tick `Unblock` > click `OK`
   - Avoid ZoneID leak:
     - Use incognito mode. That will only store `HostUrl=about:internet` (tested on Chrome and Firefox)
     - Use [Brave browser](https://brave.com/). It always stores `HostUrl=about:internet`

8. #### Avoid debugging symbols build path leak
   Some compilers such as MSVC on Windows generate PDB symbols by default. For user convenience, the full path to the symbols file at build time will be stored in every binary.
   - Avoid leak:
     - Disable symbol generation
     - Hex edit the path out
