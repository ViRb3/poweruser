## Group Policies
`Local Group Policy Editor\Computer Configuration\Admin Templates`

### Windows Update
- Disable auto-restart for updates
  - `Windows Components\Windows Update\No auto-restart with logged on users for scheduled automatic updates installations`
- Disable auto-install updates
  - `Windows Components\Windows Update\Configure Automatic Updates`
  - 2 - Notify for download and auto install

### Security
- Disable Windows Defender
  - `Windows Components\Windows Defender Antivirus\Turn off Windows Defender Antivirus`
- Allow BitLocker without TMP
  - `Windows Components\BitLocker Drive Encryption\Operating System Drives\Require additional authentication at startup`
  - Allow BitLocker without a compatible TPM
  - Do not allow TPM