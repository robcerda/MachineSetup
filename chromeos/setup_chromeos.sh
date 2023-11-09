#!/bin/bash

# Create common directories in the home directory if they don't exist
if [ ! -d ~/Scripts ]; then
    mkdir -p ~/Scripts
fi

if [ ! -d ~/Downloads ]; then
    mkdir -p ~/Downloads
fi

if [ ! -d ~/.ssh ]; then
    mkdir -p ~/.ssh
fi

# Check if the SSH config file exists, if not, create it
if [ ! -f ~/.ssh/config ]; then
    touch ~/.ssh/config
fi

# Install Seahorse (GNOME Keyring manager)
if ! dpkg -l | grep -q seahorse; then
    sudo apt install -y seahorse
fi

# Create the "Default keyring" and set it as default
seahorse --create-keyring "Default keyring"
echo "Created 'Default keyring'."

seahorse --change-password "Default keyring"
echo "Set 'Default keyring' as the default keyring."

# Check if the additional packages are installed, and if not, install them non-interactively
if ! dpkg -l | grep -q nmap; then
    sudo apt install -y nmap
fi

if ! dpkg -l | grep -q lynx; then
    sudo apt install -y lynx
fi

if ! dpkg -l | grep -q net-tools; then
    sudo apt install -y net-tools
fi

# Download deb files to the Downloads folder if they don't exist
if [ ! -f ~/Downloads/1password-latest.deb ]; then
    wget -O ~/Downloads/1password-latest.deb https://downloads.1password.com/linux/debian/amd64/stable/1password-latest.deb
fi

if [ ! -f ~/Downloads/vscode.deb ]; then
    wget -O ~/Downloads/vscode.deb 'https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64'
fi

# Install downloaded deb files non-interactively
if ! dpkg -l | grep -q '1password-latest'; then
    if sudo DEBIAN_FRONTEND=noninteractive dpkg -i ~/Downloads/1password-latest.deb; then
        echo "1Password installed successfully."
    else
        echo "Error: Failed to install 1Password."
    fi
fi

if ! dpkg -l | grep -q 'vscode'; then
    if sudo DEBIAN_FRONTEND=noninteractive dpkg -i ~/Downloads/vscode.deb; then
        echo "Visual Studio Code installed successfully."
    else
        echo "Error: Failed to install Visual Studio Code."
    fi
fi

# Remember to make this script executable before running it
# chmod +x setup_chromeos.sh
