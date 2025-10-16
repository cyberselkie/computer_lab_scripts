function Test-AuthorizedUser {
    <#
    .SYNOPSIS
        Checks if the current Windows user is authorized.

    .PARAMETER AuthorizedUsers
        Array of allowed users (domain\username or username).

    .OUTPUTS
        [bool] True if authorized, false otherwise.
    #>

    param (
        [Parameter(Mandatory)]
        [string[]]$AuthorizedUsers
    )

    # Get current user (domain\username)
    $currentUser = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name.split("\")[1]

    # Case-insensitive check
    $isAuthorized = $AuthorizedUsers -contains $currentUser

    if ($isAuthorized) {
        Write-Host "Authorized user: $currentUser" -ForegroundColor Green
	Start-Sleep -Seconds 5
        return $true
    } else {
        Write-Host "Unauthorized user: $currentUser" -ForegroundColor Red
        Write-Host "Authorized users: $($AuthorizedUsers -join ', ')" -ForegroundColor DarkGray
	Start-Sleep -Seconds 5
        return $false
    }
}
Export-ModuleMember -Function Test-AuthorizedUser