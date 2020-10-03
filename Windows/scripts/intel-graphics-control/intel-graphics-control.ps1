$DEVICE = Get-PnpDevice |
Where-Object { $_.FriendlyName -like 'Intel* Graphics' } | 
Select-Object -First 1

pnputil.exe /remove-device $DEVICE.InstanceId 
pnputil.exe /scan-devices
