## Group Policies
`Local Group Policy Editor\Computer Configuration\Admin Templates\Windows Components`

### Windows Update
  - Windows Update
    - `No auto-restart with logged on users for scheduled automatic updates installations`
    - `Configure Automatic Updates`
      - 2 - Notify for download and auto install

### Disable Windows Defender
  - Windows Components
    - Windows Defender Antivirus
      - `Turn off Windows Defender Antivirus`
      - `Turn on behavior monitoring`
      - `Monitor file and program activity on your computer`
    - Realtime protection
      - `Turn on process scanning whenever real-time protection is enabled`

### Allow BitLocker without TMP
  - BitLocker Drive Encryption
    - Operating System Drives
      - `Require additional authentication at startup`
        - Allow BitLocker without a compatible TPM
        - Do not allow TPM