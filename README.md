# Windows Random Desktop Wallpaper Changer

This PowerShell script automatically changes your desktop wallpaper to a random image from a specified folder. It's designed to run silently at system startup or user log-in, making your desktop background fresh and surprising every time you start your computer or log in.

## Features

- **Random Selection**: Chooses a random wallpaper from a specified folder.
- **Silent Operation**: Runs in the background without interrupting the user.
- **Error Logging**: Silently logs errors for troubleshooting without disturbing the user experience.
- **Customizable**: Easy to set up with your own folder of images.

## Installation

1. **Download the Script**:
   - Clone this repository or download the script `Set-RandomWallpaper.ps1` directly.
  
2. **Choose Your Image Folder**:
   - Collect the images you want to use and put them into a single folder.
  
3. **Configure the Script**:
   - Open the script in a text editor.
   - Set the default image folder path by modifying the `$folderPath` parameter:
     ```powershell
     param (
         [string]$folderPath = "C:\Path\To\Your\Image\Folder"
     )
     ```
   - Replace `"C:\Path\To\Your\Image\Folder"` with the path to your folder containing the images.
  
4. **Set Up a Log File (Optional)**:
   - In the script, find the line `$logPath = "C:\Path\To\Log\File.log"`.
   - Replace `"C:\Path\To\Log\File.log"` with the desired path for your log file.
   - This log file will record any errors or important information about the script's operation.

## Usage

#### Running the Script With Parameter
If you want to specify the image folder path each time you run the script, use the following command in PowerShell, replacing `<PathToScript>` and `<PathToImages>` with your actual paths:

```powershell
& "C:\Path\To\Script\Set-RandomWallpaper.ps1" -folderPath "<PathToImages>"
```

#### Running the Script With Hardcoded Path
Once you have hardcoded your image folder path into the script, you can change your wallpaper instantly using the script without specifying the path each time. Use this command in PowerShell, replacing `<PathToScript>` with the path to your script:

```powershell
& "C:\Path\To\Script\Set-RandomWallpaper.ps1"
```

### Setting Up Automatic Wallpaper Change

To have your wallpaper change automatically at startup or log-in:

1. **Open Task Scheduler**.
2. **Create a New Task**:
   - Name: `Random Wallpaper`
   - Trigger: Choose `At startup` and `At log on`.
   - Action: Start a program.
   - Program/script: `powershell.exe`
   - Add arguments: `-ExecutionPolicy Bypass -File "C:\Path\To\Script\Set-RandomWallpaper.ps1" -folderPath "<PathToImages>"`
   - Start in (optional): `<PathToScript>`

Replace `<PathToScript>` with the path where the script is saved and `<PathToImages>` with the path to your images folder.

## Customization

You can modify the default image folder path and log file path directly in the script:

- `$folderPath` - Path to your folder containing the images.
- `$logPath` - Path to the log file.

## Contributing

Contributions, issues, and feature requests are welcome! Feel free to check [issues page](<LinkToYourIssuesPage>).

## License

Distributed under the MIT License. See `LICENSE` for more information.
