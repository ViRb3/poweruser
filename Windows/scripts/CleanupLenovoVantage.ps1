foreach ($i in @(
        "root\iMDriverV2"
    )) {
    $wmiObject = Get-WmiObject Win32_PnPSignedDriver | Where-Object HardWareID -eq $i
    pnputil.exe /remove-device $wmiObject.DeviceID /subtree
    pnputil.exe /delete-driver $wmiObject.InfName /uninstall
}

foreach ($i in @(
        "$env:PROGRAMDATA\Lenovo\ImController",
        "$env:PROGRAMDATA\Lenovo\udc",
        "$env:LOCALAPPDATA\Lenovo\ImController"
    )) {
    Remove-Item -Recurse -Force $i | Out-Null
}

foreach ($i in @(
        "\Lenovo\ImController\*", 
        "\Lenovo\BatteryGauge\*"
    )) {
    Get-ScheduledTask -TaskPath $i | Unregister-ScheduledTask -Confirm:$false
}
