#!/bin/bash

# Update package list and upgrade installed packages
echo "Updating package list and upgrading installed packages..."
pkg update && pkg upgrade -y

# Install Go
echo "Installing Go programming language..."
pkg install golang -y

# Add Go to PATH
echo "Configuring Go environment..."
if ! grep -q 'export PATH="$PATH:$HOME/go/bin"' "$HOME/.bashrc"; then
    echo 'export PATH="$PATH:$HOME/go/bin"' >> "$HOME/.bashrc"
fi
source "$HOME/.bashrc"

# Install Subfinder
echo "Installing Subfinder..."
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest

# Install Python and pip
echo "Installing Python and pip..."
pkg install python python-pip -y

# Install Bugscanner dependencies
echo "Installing Bugscanner dependencies..."
pip install requests loguru multithreading

# Clone Bugscanner repository and install it
echo "Cloning Bugscanner repository..."
pkg install git -y
git clone https://github.com/aztecrabbit/bugscanner ~/bugscanner

echo "Installing Bugscanner requirements..."
cd ~/bugscanner && python3 -m pip install -r requirements.txt

# Install Bugscanner-Go
echo "Installing Bugscanner-Go..."
go install -v github.com/aztecrabbit/bugscanner-go@latest

# Setup storage access
echo "Setting up storage access..."
termux-setup-storage -y

# Create symlinks for easy access to storage directories
ln -s /storage/emulated/0 ~/storage/shared
ln -s /storage/emulated/0/Download ~/storage/downloads
ln -s /storage/emulated/0/DCIM ~/storage/dcim
ln -s /storage/emulated/0/Pictures ~/storage/pictures

# Additional useful commands
echo "Creating a new directory for projects..."
mkdir ~/projects

echo "Setting up a Python virtual environment (optional)..."
pkg install python-virtualenv -y
mkdir ~/venvs && cd ~/venvs && virtualenv myenv

# Completion message
echo "Installation complete! You can now use Subfinder, Bugscanner, and access your phone's storage."
termux-reload-settings
