# **Windows Random Desktop Wallpaper Changer**
This PowerShell script automatically changes your desktop wallpaper to a random image from a specified folder. It's designed to run silently at system startup or user log-in, making your desktop background fresh and surprising every time you start your computer or log in.

# Features
- **Random Selection**: Chooses a random wallpaper from a specified folder.
- **Silent Operation**: Runs in the background without interrupting the user.
- **Customizable**: Easy to set up with your own folder of images.
- **Error Logging**: Optionally logs errors for troubleshooting without disturbing the user experience.

## Compatibility and Prerequisites

- **Operating System**: Windows (Tested on Windows 11 Pro Version	23H2, OS build 22635.3061)
- **PowerShell Version**: PowerShell 5.1 or later
- **Execution Policy**: Ensure that the PowerShell execution policy allows script execution. You can check the current execution policy with the following command:
  ```powershell
  Get-ExecutionPolicy
  ```
  If it's restricted, you can change it to allow script execution with:
  ```powershell
  Set-ExecutionPolicy RemoteSigned
  ```
- **Task Scheduler Permissions**: Ensure your user account has the necessary permissions to create and manage tasks in Task Scheduler.

# Installation
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
   - This log file will record any errors or important information about the script's operation. If you don't want to log errors, set `$logPath` to `$null` or leave it as is.

# Running the Script With a Hardcoded Image Folder Path
**Once you have hardcoded your image folder path into the script, you can change your wallpaper instantly using the script without specifying the path each time. Use this command in PowerShell, replacing the path to your script:**

```powershell
& "C:\Path\To\Script\Set-RandomWallpaper.ps1"
```

# Running the Script With a Specified Image Folder Path
**If you want to specify the image folder path each time you run the script, use the following command in PowerShell, replacing the paths with your actual paths:**

```powershell
& "C:\Path\To\Script\Set-RandomWallpaper.ps1" -folderPath "C:\Windows\Web\Screen"
```

# Creating a Desktop Shortcut
**You can create a shortcut to the `Set-RandomWallpaper.ps1` script either on your desktop or in any other folder of your choice. Here's how to do it:**

## Creating a Shortcut on the Desktop
1. **Right-click on the `Set-RandomWallpaper.ps1` file**.
2. **Select "Send to" > "Desktop (create shortcut)"**:
   - In the context menu, hover over "Send to," and then choose "Desktop (create shortcut)."

## Creating a Shortcut in a Different Folder
1. **Right-click on the `Set-RandomWallpaper.ps1` file**.
2. **Select "Create Shortcut"**:
   - This will create a new shortcut in the same folder.
3. **Move the Shortcut to Your Desired Location**:
   - Drag the shortcut to any folder where you want it to be.

# Configuring the Shortcut
1. **Right-click on the newly created shortcut**.
2. **In the context menu, select "Properties"**.
3. **In the "Target" Field, Prepend with PowerShell Execution**:
   - In the Shortcut tab, locate the "Target" field.
   - Prepend the existing path with the following:
     ```powershell
     powershell.exe -ExecutionPolicy Bypass -File "C:\Path\To\Script\Set-RandomWallpaper.ps1"
     ```
     Replace `"C:\Path\To\Script\Set-RandomWallpaper.ps1"` with the actual path to your PowerShell script.

6. **Click "OK" in the Properties window to save the changes.**

# Setting Up Automatic Windows Random Desktop Wallpaper Changer
**To have your wallpaper change automatically at startup or log-in, follow these steps:**

1. **Open Task Scheduler**.
2. **Create a New Task**:
   - Name: `Random Wallpaper`
   - Trigger: Choose both `At startup` and `At log on`.
   - Action: Start a program.
   - Program/script: `powershell.exe`
   - Add arguments: `-ExecutionPolicy Bypass -File "C:\Path\To\Script\Set-RandomWallpaper.ps1" -folderPath "C:\Path\To\Your\Image\Folder"`
   - Start in (optional): `C:\Path\To\Script`

**Replace `C:\Path\To\Script\Set-RandomWallpaper.ps1` with the full path to where the script is saved and `C:\Path\To\Your\Image\Folder` with the path to your folder containing the images.**

3. **Adding a Scheduled Trigger**:
   - Edit the created task.
   - In the Triggers tab, click `New`.
   - Choose `Daily` or `Weekly` based on your preference.
   - Set the **start date** and **time**.
   - Adjust recurrence settings as needed.

# Reversing Automatic Wallpaper Change Setup
**To revert the changes and stop your wallpaper from changing automatically:**

1. **Open Task Scheduler**.
2. In the Task Scheduler library, **find the task** named `Random Wallpaper`.
3. **Right-click** on the task and select either:
   - **Delete**: This completely removes the task from Task Scheduler.
   - **Disable**: This keeps the task but stops it from running at startup or log-in.

**After completing these steps, your system will no longer change the wallpaper automatically.**

# Troubleshooting
**If you encounter issues while using the Windows Random Desktop Wallpaper Changer, here are some common problems and their solutions:**

## Script Does Not Run
- **Check Execution Policy**: Ensure your PowerShell execution policy allows script execution. Run `Get-ExecutionPolicy` in PowerShell. If it's restricted, change it with `Set-ExecutionPolicy RemoteSigned`.
- **Verify PowerShell Version**: This script requires PowerShell 5.1 or later. Check your version with `$PSVersionTable.PSVersion`.

## Wallpaper Does Not Change
- **Check Image Folder Path**: Ensure the `$folderPath` in the script correctly points to your image folder.
- **Image Format Compatibility**: Verify that the images in your folder are in a format supported by your Windows version.

## Script Runs But No Changes Occur
- **Permissions**: Ensure you have read and write permissions for the script and image folder.
- **Error Log**: If you've set up a log file, check it for any error messages that can help identify the issue.

## Task Scheduler Issues
- **Task Configuration**: Double-check the task settings in Task Scheduler, especially the `Program/script` and `Add arguments` fields.
- **User Permissions**: Ensure your user account has the necessary permissions to create and manage tasks in Task Scheduler.

## Script Errors Out
- **Syntax Errors**: If you modified the script, ensure there are no syntax errors. Revert to the original script if necessary.

## General Tips
- **Restart PowerShell**: After making changes to the system or script, restart PowerShell to ensure all changes are applied.
- **Run as Administrator**: Some actions may require elevated permissions. Try running the script or PowerShell as an administrator.

# Contributing
**Contributions, issues, and feature requests are welcome! If you experience any issues, please report them on the [issues page](https://github.com/Silentoplayz/Windows-Random-Desktop-Wallpaper-Changer/issues).**

# License
**Distributed under the MIT License. See `LICENSE` for more information.**
