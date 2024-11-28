# FindxScan

## Overview

**FindxScan** is a powerful tool that integrates Subfinder and Bugscanner to help you discover subdomains and perform vulnerability scanning efficiently. This guide will walk you through the installation and usage of FindxScan.

## Prerequisites

Before you begin, ensure you have the following installed on your device:

- Termux
- Internet connection

## Installation Instructions

Follow these steps to set up FindxScan:

1. **Install Git**
   ```bash
   pkg install git -y

2. **Clone My Repository**
   ```bash
   git clone https://github.com/XTGCODER/FindxScan

3. **Open FindxScan Directory**
   ```bash
   cd FindxScan

4. **Make The Installation Script Executable**
   ```bash
   chmod +x sonal.sh

5. **Run The Installation Script**
   ```bash
   ./sonal.sh

## Usage :
# Once the installation is complete, you can use Subfinder and Bugscanner as follows:

1. **Run Subfinder
To Find Subdomains**
   ```bash
   subfinder -dL ~/storage/downloads/Host.txt > ~/storage/downloads/Subdomains.txt

2. **Run Bugscanner
To Find Vulnerabilities/SNI**
   ```bash
   bugscanner ~/storage/downloads/Subdomains.txt

3. **Run Bugscanner-Go To Find Vulnerabilities/SNI**
   ```bash
   bugscanner-go scan direct -f ~/storage/downloads/Subdomains.txt

## Notes :
# Ensure That Your Host.txt file is Located In The ~/storage/downloads/ Directory.
# The Output Will Be Saved In Subdomains.txt Within The Same Directory.

## Credits

This Project Was Developed By **SONAL**.

- **Telegram Channel**: [@RymOfficial](https://t.me/RymOfficial)
- **Support Group**: [@RymOfficialSupport](https://t.me/RymOfficialSupport)

Thank you for your support!
