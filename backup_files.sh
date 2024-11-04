#!/bin/bash

# Check if the script is run with root privileges
if [[ $(id -u) -ne 0 ]]; then
    echo "Please run as root or with sudo privileges..."
    exit 1
fi

backup_dirs=("/etc" "/home")  # Define directories to back up
backup_date=$(date +%b-%d-%y) # Date format for backup file names
dest_dir="/root/backup_folder" # Destination directory for backups
mkdir -p "$dest_dir"

echo "Starting backup of directories: ${backup_dirs[@]}"

# Loop over each directory in the backup_dirs array
for dir in "${backup_dirs[@]}"; do
  # Create a temporary backup file in /tmp
  temp_file="/tmp/$(basename "$dir")-$backup_date.tar.gz"
  echo "Creating backup for: $dir"
  tar -Pczf "$temp_file" "$dir"

  # Check if the tar command was successful
  if [[ $? -eq 0 ]]; then
    echo "Backup successful: $dir"
  else
    echo "Backup failed: $dir"
    exit 2
  fi
  
  # Copy the backup file to the destination directory
  echo "Transferring backup to: $dest_dir"
  cp "$temp_file" "$dest_dir"

  # Verify the copy was successful
  if [[ $? -eq 0 ]]; then
    echo "Transfer successful: $dir"
  else
    echo "Transfer failed: $dir"
    exit 3
  fi
done

# Clean up temporary files
echo "Cleaning up temporary files..."
rm /tmp/*.gz
echo "---------- Backup operation successful! ----------"

# Exit script
exit 0
