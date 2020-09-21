Get-PnpDevice |
Where-Object { $_.FriendlyName -like 'Intel* Graphics' } | 
ForEach-Object {
    $_ | Disable-PnpDevice -Confirm:$false
    $_ | Enable-PnpDevice -Confirm:$false
}