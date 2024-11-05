#!/bin/bash

# Prompt user for filesystem type
read -p "What type of filesystem do you want to remove? (f:file, d:directory) " user_type

# Validate the input for type
if [[ "$user_type" != "f" && "$user_type" != "d" ]]; then
  echo "Invalid input. Please enter 'f' for files or 'd' for directories."
  exit 1
fi

# Prompt user for the name of the file or directory to remove
read -p "Enter the name (or path) of the file or directory to remove: " user_path

# Check if the file or directory exists and matches the specified type
if [ "$user_type" == "f" ] && [ -f "$user_path" ]; then
  rm -f "$user_path"
  echo "File '$user_path' has been removed."

elif [ "$user_type" == "d" ] && [ -d "$user_path" ]; then
  rm -rf "$user_path"
  echo "Directory '$user_path' has been removed."

else
  echo "The specified path does not exist or is not of the specified type."
fi

