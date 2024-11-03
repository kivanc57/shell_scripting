#!/bin/bash
echo "=== Status Checker ==="

# Prompt for service name
read -p "Enter service name: " service_name

# Check if service is installed
if ! command -v "$service_name" &> /dev/null; then
  echo "Service: $service_name does not exist"
  exit 1
else
  # Check service status and convert it to uppercase
  status=$(systemctl is-active "$service_name" 2>/dev/null | awk '{print toupper($0)}')

  # Output status of service
  echo "Status of $service_name: $status"

  # Check if service is running
  if [ "$status" = 'ACTIVE' ]; then
    echo "Service is running..."
  else
    echo "Service is not running..."
    
    # Ask if user wants to activate service
    read -p "Do you want to activate it? (y: yes / n: no) " activate
    if [ "$activate" = 'y' ]; then
      # Attempt to enable and start service
      sudo systemctl enable "$service_name"  # Enable service
      sudo systemctl start "$service_name"   # Start service
      
      # Check if service started successfully
      if systemctl is-active --quiet "$service_name"; then
        echo "$service_name has been activated and is now running."
      else
        echo "Failed to start $service_name."
      fi
    else
      echo "Exiting the program."
    fi
  fi
fi
