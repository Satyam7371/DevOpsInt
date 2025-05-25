# PowerShell script to validate IIS deployment
$url = "http://your-iis-site/"

try {
    $response = Invoke-WebRequest -Uri $url -UseBasicParsing -TimeoutSec 30
    if ($response.StatusCode -eq 200) {
        Write-Host "Site is up and running."
    } else {
        throw "Unexpected status code $($response.StatusCode)"
    }
} catch {
    Write-Error "Deployment validation failed."
    exit 1
}
