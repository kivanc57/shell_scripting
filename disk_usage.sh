#!/bin/bash

#Ask the name/path of the disk
read -p "Enter the path or name of the folder you want to check: " disk_path

echo "Checking disk usage for $disk_path..."
disk_info=$(df -h | grep -w "$disk_path")

# Check if the disk exists
if [ -z "$disk_info" ]; then
  echo "Invalid path or folder name. Please check the input and try again."
  exit 1
fi

# Get disk_size and mount_point of the disk and echo
echo "$disk_info" | while read -r line; do
  disk_size=$(echo "$line" | awk '{print $5}' | cut -d '%' -f 1)
  mount_point=$(echo "$line" | awk '{print $6}')
  echo "$disk_size% of disk at $mount_point is filled"

# Warn the user if it is filled more then 80%
  if [ "$disk_size" -gt 80 ]; then
    echo "Disk at $mount_point is utilized more than 80%, expand the disk or delete files."
  else
    echo "Enough disk space is available at $mount_point."
  fi
done

