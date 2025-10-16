function Sync-SystemTime {
    <#
    .SYNOPSIS
        Forces Windows to resync its time and rediscover network time sources.
    .DESCRIPTION
        Wraps the `w32tm /resync /rediscover` command in PowerShell.
    .NOTES
        Author: Joshua Winters Brown
        Module: SyncTime
    #>

    Write-Host "Resyncing Windows Time service..." -ForegroundColor Cyan

    try {
        Start-Process -FilePath "w32tm.exe" -ArgumentList "/resync", "/rediscover" -NoNewWindow -Wait
        Write-Host "Time resync completed." -ForegroundColor Green
    }
    catch {
        Write-Host "Failed to resync time: $($_.Exception.Message)" -ForegroundColor Red
    }
}

# Export the function
Export-ModuleMember -Function Sync-SystemTime
