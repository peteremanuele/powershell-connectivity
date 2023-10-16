# Define variables
$RouterIP = "router_ip"
$GoogleIP = "8.8.8.8"
$RDPIp = "rdp_gateway_ip"
$LogDirectory = "C:\Logs"
$LogArchiveDirectory = "C:\Logs\Archive"

# Loop for 15 minutes
$EndTime = (Get-Date).AddMinutes(15)
while ((Get-Date) -lt $EndTime) {
    $Timestamp = Get-Date

    if ($RouterIP -ne $null) {
        $RouterPingResult = Test-Connection -ComputerName $RouterIP -Count 1
        $RouterStatus = $RouterPingResult.StatusCode
    } else {
        $RouterStatus = "Skipped"
    }

    if ($GoogleIP -ne $null) {
        $GooglePingResult = Test-Connection -ComputerName $GoogleIP -Count 1
        $GoogleStatus = $GooglePingResult.StatusCode
    } else {
        $GoogleStatus = "Skipped"
    }

    if ($RDPIp -ne $null) {
        $RDPPingResult = Test-Connection -ComputerName $RDPIp -Count 1
        $RDPStatus = $RDPPingResult.StatusCode
    } else {
        $RDPStatus = "Skipped"
    }

    # Logging
    $LogEntry = "$Timestamp | Router: $RouterStatus, Google: $GoogleStatus, RDP: $RDPStatus"
    Add-Content -Path "$LogDirectory\ping_log.txt" -Value $LogEntry

    # Sleep for 15 minutes (900 seconds)
    Start-Sleep -Seconds 900
}

# Log rotation - move old logs to archive and delete
$OneWeekAgo = (Get-Date).AddDays(-7)
Get-ChildItem -Path $LogDirectory | Where-Object { $_.LastWriteTime -lt $OneWeekAgo } | Move-Item -Destination $LogArchiveDirectory
Remove-Item -Path "$LogArchiveDirectory\*" -Recurse -Force
