#!/bin/bash

# Check if the script is run with root privileges
if [[ $(id -u) -ne 0 ]]; then
    echo "Please run as root or with sudo privileges..."
    exit 1
fi

n=120
file=/var/log/fs-monitor.txt

# Check filesystem utilization every $n seconds
# Store them in $file

while true
do
    date >> "$file"
    df -h >> "$file"
    sleep "$n"
done
