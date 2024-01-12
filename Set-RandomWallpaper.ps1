# PowerShell script to set a random desktop wallpaper

param (
    [string]$folderPath = "C:\Path\To\Your\Image\Folder",
    [string]$logPath = $null,  # Making log file optional with a default value of $null
    [switch]$skipLogging = $false  # Adding a switch parameter to skip logging
)

# Function to log messages
function Write-Log {
    param ([string]$message)
    if ($logPath -and -not $skipLogging) {
        Add-Content -Path $logPath -Value "$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss'): $message"
    }
}

# Check if the folder path exists
if (-not (Test-Path -Path $folderPath)) {
    Write-Log "Error: The specified folder path does not exist."
    exit
}

# Get all image files from the folder
$images = Get-ChildItem -Path $folderPath -Include @("*.jpg", "*.jpeg", "*.png") -Recurse

# Check if images are found
if ($images.Count -eq 0) {
    Write-Log "Error: No images found in the specified folder."
    exit
}

# Select a random image
$randomImage = Get-Random -InputObject $images

# Full path of the image
$imagePath = Join-Path -Path $folderPath -ChildPath $randomImage.Name

# Log the selected image path
Write-Log "Setting wallpaper to: $imagePath"

# Set the desktop background
Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;

public class Wallpaper {
    [DllImport("user32.dll", CharSet = CharSet.Auto)]
    public static extern int SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
}
"@

# SPI_SETDESKWALLPAPER = 20, UpdateIniFile = 0x01, SendWinIniChange = 0x02
$SPI_SETDESKWALLPAPER = 20
$UpdateIniFile = 0x01
$SendWinIniChange = 0x02

[Wallpaper]::SystemParametersInfo($SPI_SETDESKWALLPAPER, 0, $imagePath, $UpdateIniFile -bor $SendWinIniChange)
