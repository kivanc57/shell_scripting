#!/bin/bash

path=$1
age=30

# Introduction
echo "This program deletes files that are older than $age days in the given path: $path"

# Check if the path is provided and exists
if [[ -z "$path" || ! -d "$path" ]]; then
  echo "Invalid or nonexistent path. Please check the input and try again."
  exit 1
fi

# Delete older files
find "$path" -mtime +"$age" -delete

# Check if the deletion was successful
if [[ $? -eq 0 ]]; then
  echo "Deletion successful"
else
  echo "Deletion failed"
fi

