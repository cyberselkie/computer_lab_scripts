## Works on My Machine
This Refresh script also installs Respondus LockDown Browsers. If you do not have or require this, comment out or delete this section in `refresh.ps1`:

```powershell
Import-Module "$PSScriptRoot\modules\install_lockdown_browser.psm1" -Force

# ----- script
# ----- here

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
```

## Getting Started:
Copy `example_globals.psm1` as `globals.psm1` and Fill out your required information:

- $Global:AuthorizedUsers should include users that are authorized to run this script.
- $Global:DoNotDeleteTheseProfiles includes users that will NOT get deleted by the script.

The RefreshScript shortcut runs `refresh.ps1` with an ExecutionPolicy Bypass flag, for use with laptops with ExecutionPolicy restrictions. If removed from that folder, it will not run anything.
