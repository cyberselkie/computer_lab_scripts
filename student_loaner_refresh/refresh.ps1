Import-Module "$PSScriptRoot\modules\globals.psm1" -Force
Import-Module "$PSScriptRoot\modules\banner.psm1"
Import-Module "$PSScriptRoot\modules\check_admin.psm1"
Import-Module "$PSScriptRoot\modules\sync_time.psm1"
Import-Module "$PSScriptRoot\modules\gpo.psm1" -Force
Import-Module "$PSScriptRoot\modules\install_lockdown_browser.psm1" -Force
# Account Management
Import-Module "$PSScriptRoot\modules\account_management\auto_delete.psm1"
Import-Module "$PSScriptRoot\modules\account_management\clear_profile.psm1"

# prints banner to console
Print-Banner

# confirms user is admin account
if (-not (Test-AuthorizedUser -AuthorizedUsers $Global:AuthorizedUsers)) {
    Write-Host "Exiting script..." -ForegroundColor Yellow
    exit
}

# syncs system time
Sync-SystemTime

# Delete temp/logs/etc.
Invoke-AutoDelete -TargetPath "C:\Temp"

# Clear old user profiles
Clear-UserProfiles -KeepProfiles $global:DoNotDeleteTheseProfiles

# Install Respondus
$labPath = ".\lockdown_browser_installers\respondus_lockdown_browser_lab_edition.msi"
$oemPath = ".\lockdown_browser_installers\respondus_lockdown_browser_lab_oem.msi"

$missingFiles = @()
if (-not (Test-Path $labPath)) { $missingFiles += $labPath }
if (-not (Test-Path $oemPath)) { $missingFiles += $oemPath }

if ($missingFiles.Count -gt 0) {
    Write-Warning "The following installer(s) are missing:`n$($missingFiles -join "`n")"
} else {
    Install-Lockdown -VersionName "2.1.3.07" -LabInstallerPath $labPath -OemInstallerPath $oemPath
}

Invoke-RefreshGPO -VersionName "RefreshWindows V5.1"
