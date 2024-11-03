#!/bin/bash

# Check if parameter(-s) are given 
if [[ $# -eq 0 ]]; then
  echo "Usage: please provide software names as command line arguments"
  exit 1
fi

# Check if program runs from root user or with sudo privileges
if [[ $(id -u) -ne 0 ]]; then
  echo "Please run as root user or with sudo privileges"
  exit 2
fi

# Update package lists
echo "Updating package lists..."
sudo apt update &>/dev/null

# Check and install each package
for software in "$@"; do
  # Check if package(-s) is  available for installation
  if apt-cache policy "$software" | grep -q "Candidate:"; then
    if which "$software" &>/dev/null; then
      echo "$software is already installed"
    else
      echo "Installing $software..."
      sudo apt install "$software" -y &>/dev/null
      if [[ $? -eq 0 ]]; then
        echo "Successfully installed: $software"
      else
        echo "Failed to install: $software"
      fi
    fi
  else
    echo "$software is not installable."
  fi
done

# Clean up unnecessary packages and cache
echo "Cleaning up unnecessary packages..."
sudo apt autoremove -y &>/dev/null
sudo apt autoclean &>/dev/null
echo "Cleanup complete."
