#!/bin/bash

# Update package list and upgrade installed packages
pkg update && pkg upgrade -y

# Install Go
pkg install golang -y

# Add Go to PATH
echo 'export PATH="$PATH:$HOME/go/bin"' >> $HOME/.bashrc
source $HOME/.bashrc

# Install Subfinder
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest

# Install Python and pip
pkg install python python-pip -y

# Install Bugscanner dependencies
pip install requests loguru multithreading

# Clone Bugscanner repository and install it
pkg install git -y
git clone https://github.com/aztecrabbit/bugscanner ~/bugscanner
cd ~/bugscanner && python3 -m pip install -r requirements.txt

# Install Bugscanner-Go
go install -v github.com/aztecrabbit/bugscanner-go@latest

echo "Installation complete! You can now use Subfinder and Bugscanner."
