The script is specifically looking for the following two files

```powershell
```powershell
Install-Lockdown `
    -VersionName "2.1.3.07" `
    -LabInstallerPath ".\lockdown_browser_installers\respondus_lockdown_browser_lab_edition.msi" `

    -OemInstallerPath ".\lockdown_browser_installers\respondus_lockdown_browser_lab_oem.msi"
```


Name them accordingly....

Respondus LockDown Browser Lab Edition requires additional files in the same folder as the installer to run correctly. You will get these files from Respondus if you use them. 