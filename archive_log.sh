#!/bin/bash

# List all the possible apps
echo "Available apps:"
ls -d /var/log/*/

# Get the application name from user input
read -p "Enter the app name: " app_name

# Check if the app name is provided and if the directory exists
if [[ -z "$app_name" || ! -d "/var/log/$app_name" ]]; then
    echo "Invalid app name. Please check the input and try again."
    exit 1
fi

# Directories
LOG_DIR="/var/log/${app_name}/"
ARCHIVE_DIR="/var/log/${app_name}/archive/"

# Ensure directories exist
if [[ ! -d "$LOG_DIR" ]]; then
    echo "Log directory $LOG_DIR does not exist. Exiting."
    exit 1
fi

if [[ ! -d "$ARCHIVE_DIR" ]]; then
    mkdir -p "$ARCHIVE_DIR"
    echo "Created archive directory $ARCHIVE_DIR."
fi

# Move log files older than 30 days to the archive directory
find "$LOG_DIR" -name "*.log" -mtime +30 -exec mv {} "$ARCHIVE_DIR" \;

# Compress moved log files
if [[ -n "$(ls -A "$ARCHIVE_DIR")" ]]; then
    if gzip "$ARCHIVE_DIR"/*.log; then
        echo "Log files older than 30 days archived and compressed successfully."
    else
        echo "Failed to compress log files." >&2
        exit 1
    fi
else
    echo "No log files to compress in $ARCHIVE_DIR."
fi

