#!/bin/bash
echo "=== Status Checker ==="

# Prompt for application name
read -p "Enter application name: " app_name

# Check if the application is installed
if ! command -v "$app_name" &> /dev/null; then
  echo "Application: $app_name does not exist"
  exit 1
else
  # Check the service status and convert it to uppercase
  status=$(systemctl is-active "$app_name" 2>/dev/null | awk '{print toupper($0)}')

  # Output the status of the service
  echo "Status of $app_name: $status"

  # Check if the service is running
  if [ "$status" = "ACTIVE" ]; then
    echo "Service is running..."
  else
    echo "Service is not running..."
  fi
fi
