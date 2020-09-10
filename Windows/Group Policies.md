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
