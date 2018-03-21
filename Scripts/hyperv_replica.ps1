<# --- Without arguments --- #>
If ( -Not $args[0]) {Write-Output "Usage: hyperv_replica.ps1 health|lastsync SRVNAME"; exit}

<# --- Replication Health --- #>
If ( $args[0] -eq "health") {
    $SRVNAME = $args[1]
    $HEALTH = Get-VMReplication | Where-Object {$_.Name -like "$SRVNAME"} | select Health | ft -HideTableHeaders | Out-String
    $HEALTH = $HEALTH.Trim()

    if ( $HEALTH -eq 'Normal' ) { "0" }
    elseif ( $HEALTH -eq 'Warning' ) { "1" }
    elseif ( $HEALTH -eq 'Critical' ) { "2" }
    else { "3" }
}

<# --- Replication Last Sync --- #>
If ( $args[0] -eq "lastsync") {
    $SRVNAME = $args[1]
    $LASTSYNC = Measure-VMReplication | Where-Object {$_.Name -like "$SRVNAME"} | select LReplTime | ft -HideTableHeaders | Out-String
    $LASTSYNC = $LASTSYNC.Trim()
    $LASTSYNC = Get-Date -Date "$LASTSYNC" -Format "yyyy/MM/dd HH:mm:ss"
    $DATE1 = Get-Date -Date "01/01/1970" -Format "yyyy/MM/dd HH:mm:ss"
    $DATE2 = [System.TimeZoneInfo]::ConvertTimeBySystemTimeZoneId($LASTSYNC, [System.TimeZoneInfo]::Local.Id, 'GMT Standard Time')
    (New-TimeSpan -Start $DATE1 -End $DATE2).TotalSeconds
}
