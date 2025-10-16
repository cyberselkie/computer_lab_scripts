function Clear-UserProfiles {
    <#
    .SYNOPSIS
        Removes all user profiles except for those explicitly whitelisted.

    .DESCRIPTION
        Uses WMI (Win32_UserProfile) to delete local user profiles safely.
        Accepts a list of profile names to preserve (via parameter or global variable).

    .PARAMETER KeepProfiles
        A list of usernames whose profiles should NOT be deleted.
        If not provided, the function uses $global:DoNotDeleteTheseProfiles if it exists.

    .EXAMPLE
        Clear-UserProfiles -KeepProfiles @('Administrator', 'Public')
    #>

    param (
        [Parameter(Mandatory = $false)]
        [string[]]$KeepProfiles = $null
    )

    # Use global variable if parameter not provided
    if (-not $KeepProfiles -and $global:DoNotDeleteTheseProfiles) {
        $KeepProfiles = $global:DoNotDeleteTheseProfiles
    }

    # Fallback default list if nothing is set
    if (-not $KeepProfiles) {
        $KeepProfiles = @('Administrator', 'Public', 'Default', 'Default_User', 'defaultuser0')
    }

    Write-Host "🧩 Profiles to keep: $($KeepProfiles -join ', ')" -ForegroundColor Yellow
    Write-Host ""

    $userProfiles = Get-WmiObject -Class Win32_UserProfile | Where-Object { $_.Special -eq $false }

    Write-Host "---User Profile List (Before)---"
    foreach ($profile in $userProfiles) {
        $username = $profile.LocalPath.Split('\')[-1]
        Write-Host $username
    }
    Write-Host "--------------------------------`n"

    foreach ($profile in $userProfiles) {
        if ($profile.LocalPath) {
            $username = $profile.LocalPath.Split('\')[-1]
            if ($KeepProfiles -notcontains $username) {
                try {
                    Get-WmiObject Win32_UserProfile -Filter "SID='$($profile.SID)'" | Remove-WmiObject
                    Write-Host "Deleted profile: $username"
                } catch {
                    Write-Host "Failed to delete profile: $username ($_)"
                }
            } else {
                Write-Host "Kept profile: $username"
            }
        }
    }

    Write-Host "`n---User Profile List (After)---"
    Get-WmiObject -Class Win32_UserProfile | Where-Object { $_.Special -eq $false } |
        ForEach-Object { $_.LocalPath.Split('\')[-1] }
    Write-Host "--------------------------------`n"
}

Export-ModuleMember -Function Clear-UserProfiles