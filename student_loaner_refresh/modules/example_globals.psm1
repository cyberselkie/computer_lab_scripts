$Global:ScriptVersion = "6.0"
$Global:AuthorizedUsers = @(
    "Local_Administrative_Account",
    "DOMAIN\Account"
)
$global:DoNotDeleteTheseProfiles = @(
    'Administrator', 'Public', 'Local_Administrative_Account'
)