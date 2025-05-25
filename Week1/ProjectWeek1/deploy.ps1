# PowerShell Deployment Script for IIS
param (
    [string]$iisSiteName = "YourIISSiteName",
    [string]$sourcePath = "C:\agent\_work\r1\a\drop",
    [string]$iisPath = "C:\inetpub\wwwroot\YourIISSiteName"
)

Write-Host "Deploying files to IIS..."

Copy-Item -Path "$sourcePath\*" -Destination $iisPath -Recurse -Force

Import-Module WebAdministration
Restart-WebAppPool -Name $iisSiteName

Write-Host "Deployment completed."
