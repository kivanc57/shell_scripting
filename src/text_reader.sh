#!/bin/bash
echo "== Text Reader Program =="

# Get input_text
read -p "Enter the text file / path: " input_text

# Define read_text function
read_text() {
  local input_text="$1"

  # Check if input_text is valid
  if ! [[ -f "$input_text" ]]; then
    echo "Invalid file path, please try again."
    exit 1
  # Read each line of input_text
  else 
    while read -r line; do
      echo "$line"
    done < "$input_text"
    echo "Reading is complete"
  fi
}

# Call read_text
read_text "$input_text"
