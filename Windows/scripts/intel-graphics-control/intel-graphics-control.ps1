$DEVICE = Get-PnpDevice |
Where-Object { $_.FriendlyName -like 'Intel* Graphics' } | 
Select-Object -First 1

pnputil.exe /remove-device $DEVICE.InstanceId 
pnputil.exe /scan-devices

$PROCS = "dwm", "explorer"
foreach ($PROC in $PROCS) {
    Stop-Process -Name $PROC -Force
}

Start-Sleep -Seconds 1

foreach ($PROC in $PROCS) {
    if (!(Get-Process -Name $PROC)) {
        Start-Process -FilePath $PROC
    }
}