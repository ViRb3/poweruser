## Group Policies
`Local Group Policy Editor\Computer Configuration\Admin Templates\Windows Components`

1. ### Windows Update
   - Windows Update
     - No auto-restart with logged on users for scheduled automatic updates installations
     - Configure Automatic Updates
       - `2 - Notify for download and auto install`

2. ### Disable Windows Defender
   - Windows Components
    - Microsoft Defender Antivirus
      - Turn off Microsoft Defender Antivirus
      - Realtime protection
        - Turn off real-time protection
        - Turn on behavior monitoring
          - `Disable` policy
      - MAPS
        - Join Microsoft MAPS
          - `Enable` policy, set to `Disabled`
        - Send file samples when further analysis is required
          - `Never send`

3. ### Allow BitLocker without TPM
   - BitLocker Drive Encryption
    - Operating System Drives
      - Require additional authentication at startup
        - Allow BitLocker without a compatible TPM
        - Do not allow TPM
