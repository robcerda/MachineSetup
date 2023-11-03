# ChromeOS Machine Setup

This section of the repository is dedicated to setting up and maintaining my consistent development environment on ChromeOS.

## Intent

The primary goal is to ensure that my development environment on ChromeOS is standardized and ready to use whenever I log into a new machine. By following the steps outlined here, I should be ready to go in no time!

## Getting Started

1. Log into your ChromeOS machine.

2. Enable Linux Apps:
   - ChromeOS, by default, doesn't have a development environment enabled. To get started, enable Linux Apps by following these steps:
     - Open Chrome.
     - Click on your profile picture in the bottom right.
     - Go to "Settings."
     - Scroll down to "Linux (Beta)."
     - Click "Turn On."

3. Ensure that your Linux username is set to `rob`. You can check your username by opening the Linux terminal and running `whoami`. If it's not `rob`, you can change it using the `usermod` command.

4. Clone this repository:
   ```bash
   git clone https://github.com/your-username/MachineSetup.git
   cd MachineSetup/chromeos

**Optional**
run 
`bash -c "$(curl -fsSL https://raw.githubusercontent.com/robcerda/MachineSetup/master/chromeos/setup_chromeos.sh)"
`