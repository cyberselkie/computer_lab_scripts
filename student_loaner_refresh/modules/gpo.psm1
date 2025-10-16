function Invoke-RefreshGPO {
    <#
    .SYNOPSIS
        Forces a Group Policy update on the local machine.
    .DESCRIPTION
        Uses the gpupdate command with /force to refresh all Group Policy settings.
        Clears the console after completion.
    .PARAMETER VersionName
        Optional label to display the version or step info.
    .EXAMPLE
        Invoke-RefreshGPO -VersionName "RefreshWindows V5.1"
    #>

    param(
        [string]$VersionName = "RefreshWindows"
    )

    # Display step info
    Write-Host ""
    Write-Host "____________________________________" -ForegroundColor DarkGray
    Write-Host " STEP 3 " -ForegroundColor Green
    Write-Host " AUTO Gpupdate /force" -ForegroundColor Cyan
    Write-Host "____________________________________" -ForegroundColor DarkGray
    Write-Host ""

    # Run gpupdate /force
    Write-Host "Running gpupdate /force..." -ForegroundColor Yellow
    cmd.exe /c "echo N | gpupdate /force"

    Write-Host "Group Policy refresh complete." -ForegroundColor Green

    # Clear screen
    Clear-Host
}

Export-ModuleMember -Function Invoke-RefreshGPO

