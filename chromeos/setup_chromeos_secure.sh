#!/bin/bash

# Update package lists
sudo apt update

# Install File Analysis Tools
if ! dpkg -l | grep -q exiftool; then
    sudo apt install -y exiftool
fi

if ! dpkg -l | grep -q binwalk; then
    sudo apt install -y binwalk
fi

# Install Strings and File Command (usually pre-installed)
if ! dpkg -l | grep -q binutils; then
    sudo apt install -y binutils
fi

if ! dpkg -l | grep -q file; then
    sudo apt install -y file
fi

# Install ClamAV for virus scanning
if ! dpkg -l | grep -q clamav; then
    sudo apt install -y clamav
    sudo freshclam
fi

# Install Network Analysis Tools
if ! dpkg -l | grep -q tcpdump; then
    sudo apt install -y tcpdump
fi

if ! dpkg -l | grep -q wireshark; then
    sudo apt install -y wireshark
    sudo dpkg-reconfigure wireshark-common # Enable non-root user to capture packets
    sudo usermod -aG wireshark $USER
fi

# Install System Call Tracing Tools
if ! dpkg -l | grep -q strace; then
    sudo apt install -y strace
fi

echo "All necessary tools for file inspection have been installed."

# Note: You may need to log out and log back in for some changes to take effect, especially for wireshark.

# Remember to make this script executable before running it
# chmod +x mp4_inspection_setup.sh
