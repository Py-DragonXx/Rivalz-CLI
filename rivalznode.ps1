# Temporarily set the execution policy to allow script execution
If ((Get-ExecutionPolicy) -ne 'Bypass') {
    Set-ExecutionPolicy Bypass -Scope Process -Force
    Write-Output "Execution policy set to Bypass for this session."
} else {
    Write-Output "Execution policy already set to Bypass."
}

# Install fnm (Fast Node Manager) using winget
winget install Schniz.fnm

# Wait for fnm to install
Start-Sleep -Seconds 8

# Check if the script is running from a temporary directory
$currentPath = $PSCommandPath
if ($currentPath -like "\Temp") {
    # Restart PowerShell to ensure fnm environment variables are recognized
    Start-Process powershell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File "$HOME\Desktop\rivalznode.ps1"'
    exit
}

# Configure fnm environment to work with the shell (use on directory change)
fnm env --use-on-cd | Out-String | Invoke-Expression

# Install Node.js version 20 if it's missing
fnm use --install-if-missing 22

# Verify Node.js version (should print v22.9.0)
$nodeVersion = node -v
Write-Output "Node.js version: $nodeVersion"

# Verify npm version (should print 10.8.2)
$npmVersion = npm -v
Write-Output "npm version: $npmVersion"

# Install the latest version of Rivalz client node
npm i -g rivalz-node-cli@2.6.2
Write-Output "Installing: CLI rClient v2.6.2..."

# Run the Rivalz node
rivalz run

# Notify the user that the setup has been completed
Write-Output "Rivalz node is running. You can now continue manually setting up your rClient!"
