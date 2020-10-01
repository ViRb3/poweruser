# Applications

## VMWare

1. #### High CPU usage by VMWare Workstation
   - Disable `VM Sharing` in program settings
2. #### USB3 UAS failure in VMWare
   1. Shut down the VM
   2. Append to the `.vmx` file of the VM:
      ```
      usb.generic.keepStreamsEnabled = "FALSE"
      ```
   3. Make sure `USB 3.0` compatibility mode is selected in the VM USB settings
   - [More information](https://superuser.com/questions/1442507/error-usb3-uas-passthrough-vmware-workstation-15)

## AdGuard

1. #### Filtering does not work on all websites
   - Certain browsers (such as Firefox) will pin the original certificate if connecting without AdGuard, preventing AdGuard from working in the future
   - Delete all history and cache to clean such records

## ThrottleStop

1. #### Auto-start
   1. Run in Administrator Powershell:
      ```powershell
      $A = New-ScheduledTaskAction -Execute "C:\Program Files\ThrottleStop\ThrottleStop.exe"
      $T = New-ScheduledTaskTrigger -AtLogon
      $P = New-ScheduledTaskPrincipal -GroupId "BUILTIN\Administrators" -RunLevel Highest
      $S = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -ExecutionTimeLimit '00:00:00'
      $D = New-ScheduledTask -Action $A -Principal $P -Trigger $T -Settings $S
      Register-ScheduledTask "ThrottleStop" -InputObject $D
      ```
   2. From the ThrottleStop GUI, go to `Options` and tick `Start Minimized`
