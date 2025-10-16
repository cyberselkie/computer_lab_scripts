function Install-Lockdown {
    <#
    .SYNOPSIS
        Installs Respondus LockDown Browser Lab and OEM Editions.
    .DESCRIPTION
        Automates the installation of both Lab and OEM versions of Respondus LockDown Browser
        using PowerShell’s Start-Process cmdlet.
    .PARAMETER VersionName
        Version label (for logging/display purposes)
    .PARAMETER LabInstallerPath
        Path to the Lab Edition installer (.msi or .exe)
    .PARAMETER OemInstallerPath
        Path to the OEM Edition installer (.msi or .exe)
    .EXAMPLE
        Install-Lockdown -VersionName "2.1.3.06" `
                         -LabInstallerPath ".\script_files\Lockdown_Installers\2.1.3.06 (09-25)\Respondus LockDown Browser - Lab Edition.msi" `
                         -OemInstallerPath ".\script_files\Lockdown_Installers\Respondus LockDown Browser Lab OEM.msi"
    #>

    param(
        [Parameter(Mandatory = $true)]
        [string]$VersionName,

        [Parameter(Mandatory = $true)]
        [string]$LabInstallerPath,

        [Parameter(Mandatory = $true)]
        [string]$OemInstallerPath
    )

    Write-Host ""
    Write-Host "________________________________________" -ForegroundColor DarkGray
    Write-Host " STEP 2 " -ForegroundColor Green
    Write-Host " Install Lockdown Browser ($VersionName)" -ForegroundColor Cyan
    Write-Host "________________________________________" -ForegroundColor DarkGray
    Write-Host ""

    # --- Install Lab Edition ---
    Write-Host "Installing Respondus LockDown Browser Lab Edition..." -ForegroundColor Yellow
    if (Test-Path $LabInstallerPath) {
        Start-Process -FilePath $LabInstallerPath -ArgumentList "/passive" -Wait
        Write-Host "Respondus Lab Edition installed successfully!" -ForegroundColor Green
    } else {
        Write-Host "Lab installer not found at: $LabInstallerPath" -ForegroundColor Red
        return
    }

    # --- Install OEM Edition ---
    Write-Host "Installing Respondus LockDown Browser OEM Edition..." -ForegroundColor Yellow
    if (Test-Path $OemInstallerPath) {
        Start-Process -FilePath $OemInstallerPath -ArgumentList "/passive" -Wait
        Write-Host "Respondus OEM Edition installed successfully!" -ForegroundColor Green
    } else {
        Write-Host "OEM installer not found at: $OemInstallerPath" -ForegroundColor Red
        return
    }

    Write-Host "Installation complete. Please reboot and run manual update if needed." -ForegroundColor Cyan
    Clear-Host
}

Export-ModuleMember -Function Install-Lockdown 

