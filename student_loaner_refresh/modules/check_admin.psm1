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
    $currentUser = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name

    # Case-insensitive check
    $isAuthorized = $AuthorizedUsers -contains $currentUser

    if ($isAuthorized) {
        Write-Host "✅ Authorized user: $currentUser" -ForegroundColor Green
        return $true
    } else {
        Write-Host "⛔ Unauthorized user: $currentUser" -ForegroundColor Red
        Write-Host "Authorized users: $($AuthorizedUsers -join ', ')" -ForegroundColor DarkGray
        return $false
    }
}
Export-ModuleMember -Function Test-AuthorizedUser