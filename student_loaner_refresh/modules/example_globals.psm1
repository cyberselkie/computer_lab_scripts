$Global:ScriptVersion = "6.0"
$Global:AuthorizedUsers = @(
    "Local_Administrative_Account",
    "DOMAIN\Account"
)
$Global:DoNotDeleteTheseProfiles = @(
    'Administrator', 'Public', 'Local_Administrative_Account'
)