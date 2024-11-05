#!/bin/bash

# Check if the script is run with root privileges
if [[ $(id -u) -ne 0 ]]; then
    echo "Please run as root or with sudo privileges..."
    exit 1
fi

# Function to get the Linux distribution and install a package
get_linux_distro() {
    local package_name="$1"
    if command -v apt &> /dev/null; then
        sudo apt update && sudo apt install -y "$package_name"  # For Debian/Ubuntu
    elif command -v dnf &> /dev/null; then
        sudo dnf install -y "$package_name"  # For Fedora
    elif command -v yum &> /dev/null; then
        sudo yum install -y "$package_name"  # For CentOS/RHEL
    elif command -v pacman &> /dev/null; then
        sudo pacman -S --noconfirm "$package_name"  # For Arch Linux
    else
        echo "Unsupported Linux distribution or package manager."
    fi
}

# Prompt the user to enter the package name
read -p "Enter the package name: " package_name

# Check if the package name was provided
if [[ -z "$package_name" ]]; then
    echo "Please provide a package name to proceed..."
    exit 2
fi

# Detect the current operating system
current_os="$(uname -s)"

# Handle installation for different OS
case "$current_os" in
    Linux)     
        get_linux_distro "$package_name"
        ;;
    Darwin)
        if command -v brew &> /dev/null; then
            brew install "$package_name"  # Install using Homebrew
        elif command -v port &> /dev/null; then
            sudo port install "$package_name"  # Install using MacPorts
        else
            echo "Neither Homebrew nor MacPorts is installed."
        fi
        ;;
    CYGWIN*|MINGW32*|MSYS*|MINGW*)
        if command -v choco &> /dev/null; then
            choco install "$package_name" -y  # Install using Chocolatey
        elif command -v winget &> /dev/null; then
            winget install "$package_name" -e  # Install using Windows Package Manager
        else
            echo "Neither Chocolatey nor Windows Package Manager is installed."
        fi
        ;;
    *)
        echo "Unsupported operating system."
        ;;
esac
