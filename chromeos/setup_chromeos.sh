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

# Add any specific configurations to the SSH config file if needed
# Example: echo "Host example.com\n  Port 22\n  User myusername" >> ~/.ssh/config

# Download deb files to the Downloads folder if they don't exist
if [ ! -f ~/Downloads/1password-latest.deb ]; then
    wget -O ~/Downloads/1password-latest.deb https://downloads.1password.com/linux/debian/amd64/stable/1password-latest.deb
fi

if [ ! -f ~/Downloads/vscode.deb ]; then
    wget -O ~/Downloads/vscode.deb 'https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64'
fi

# Install downloaded deb files
sudo dpkg -i ~/Downloads/1password-latest.deb
sudo dpkg -i ~/Downloads/vscode.deb

# Check if the additional packages are installed and install them if not
if ! dpkg -l | grep -q nmap; then
    sudo apt install nmap
fi

if ! dpkg -l | grep -q lynx; then
    sudo apt install lynx
fi

if ! dpkg -l | grep -q net-tools; then
    sudo apt install net-tools
fi

# Remember to make this script executable before running it
# chmod +x setup_chromeos.sh
