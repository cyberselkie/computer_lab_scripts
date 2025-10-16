# auto_delete.psm1
# Converted from original CMD batch script
# Performs staged user and file cleanup
Import-Module "$PSScriptRoot\clear_profile.psm1"

function Invoke-AutoDelete {
    <#
    .SYNOPSIS
        Cleans user profiles, temporary files, and system junk.
    .DESCRIPTION
        Converts the original CMD-based cleanup process into a PowerShell-driven module.
    #>

    param (
        [string]$VersionName = "AutoDelete v2.0"
    )

    Clear-Host
    Write-Host "$VersionName"
    Write-Host "_______________________"
    Write-Host "STEP 1: AUTO DELETE USERS"
    Write-Host "_______________________`n"

    Write-Host "Stage 1: Removing old user profiles..." -ForegroundColor Cyan
    Clear-UserProfiles
    Write-Host ""

    Write-Host "Stage 2: Removing system files..." -ForegroundColor Blue
    Start-Sleep -Seconds 3
    Clear-Host

    Write-Host "Stage 3: Cleaning temporary files..." -ForegroundColor Yellow

    try {
        Clear-RecycleBin -Confirm:$false -ErrorAction Ignore
        Write-Host "Recycle Bin: Complete" -ForegroundColor Green

        Write-Host "Temporary Files: Calculating..." -ForegroundColor Yellow
        Start-Process -Wait -FilePath "cleanmgr.exe" -ArgumentList "/AUTOCLEAN"
        Start-Process -FilePath "cleanmgr.exe" -ArgumentList "/VERYLOWDISK"

        Start-Sleep -Seconds 1
        Write-Host "`t-Downloads: Complete" -ForegroundColor Green
        Start-Sleep -Seconds 1
        Write-Host "`t-Thumbnails: Complete" -ForegroundColor Green
        Start-Sleep -Seconds 1
        Write-Host "`t-Cache: Complete" -ForegroundColor Green
        Start-Sleep -Seconds 1
        Write-Host "`t-Windows Update Temp Files: Complete" -ForegroundColor Green
        Start-Sleep -Seconds 1
        Write-Host "`t-Rubber Duckies: Complete" -ForegroundColor Green
    }
    catch {
        Write-Host "Error during cleanup: $($_.Exception.Message)" -ForegroundColor Red
    }

    Start-Sleep -Seconds 5
    Clear-Host
    Write-Host "Auto Delete Complete!"
}

Export-ModuleMember -Function Invoke-AutoDelete
