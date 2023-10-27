#!/bin/bash

# Check if Homebrew is installed, and if not, install it
if ! command -v brew &> /dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Check if 'mas' is installed, and if not, install it using Homebrew
if ! command -v mas &> /dev/null; then
    brew install mas
fi

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

# Install specific apps from the App Store using the 'mas' command
# Example: Install 1Password and Tailscale
if ! mas list | grep -q "1Password"; then
    mas install 443987910  # 1Password
fi

if ! mas list | grep -q "Tailscale"; then
    mas install 1475387142  # Tailscale
fi

# Remember to make this script executable before running it
# chmod +x setup_macos.sh
