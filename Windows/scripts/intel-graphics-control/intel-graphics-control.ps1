Get-PnpDevice |
Where-Object { $_.FriendlyName -like 'Intel* Graphics' } | 
ForEach-Object {
    pnputil.exe /remove-device $_.InstanceId
    pnputil.exe /scan-devices
}