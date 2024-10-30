#!/bin/bash

# Check whether path exists, give error in case
if [ -z "$1" ]; then
  echo "Invalid path or folder name. Please check the input and try again."
  exit 1
fi

# Get first parameter
path=$1
file_amount=10
output_file=/tmp/filesize.txt

# Introduction
echo "This program ($0) retrieves top $file_amount largest files in $1 as $output_file."

# Print path
echo "Given path: $path"

# Get the top 10 biggest files
du -ah $path | sort -rh | head -n $file_amount > $output_file

# Display the results
cat $output_file

