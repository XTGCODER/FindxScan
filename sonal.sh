#!/bin/bash

# Update package list and upgrade installed packages
echo "Updating package list and upgrading installed packages..."
pkg update -y && pkg upgrade -y

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

# Check if Subfinder was installed successfully
if [ ! -f "$HOME/go/bin/subfinder" ]; then
    echo "Subfinder installation failed. Please check the logs for errors."
    exit 1
fi

# Install Python and pip
echo "Installing Python and pip..."
pkg install python python-pip -y

# Install Bugscanner-Go
echo "Installing Bugscanner-Go..."
go install -v github.com/aztecrabbit/bugscanner-go@latest

# Check if Bugscanner-Go was installed successfully
if [ ! -f "$HOME/go/bin/bugscanner-go" ]; then
    echo "Bugscanner-Go installation failed. Please check the logs for errors."
    exit 1
fi

# Setup storage access
echo "Setting up storage access..."
termux-setup-storage -y

# Create symlinks for easy access to storage directories if they don't exist
if [ ! -d ~/storage ]; then
    ln -s /storage/emulated/0 ~/storage/shared || echo "Failed to create symlink for shared storage"
    ln -s /storage/emulated/0/Download ~/storage/downloads || echo "Failed to create symlink for downloads"
fi

# Navigate to home directory after all installations are complete
echo "Navigating to the home directory..."
cd ~

# Create a configuration directory for Subfinder if it doesn't exist
if [ ! -d "$HOME/.config/subfinder" ]; then
    mkdir -p "$HOME/.config/subfinder"
    echo "Please configure Subfinder by editing the config.yaml file in $HOME/.config/subfinder."
fi

# Completion message
echo "Installation complete! You can now use Subfinder and Bugscanner-Go, and access your phone's storage."
