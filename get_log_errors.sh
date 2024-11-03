#!/bin/bash
error_path=/var/log/messages

get_errors(){
  local error_path="$1"
  matched_error=$(grep -i "error" "$error_path")
  
  if [[ $? -eq 0 ]]; then
    echo "Found error in OS logs: $matched_error"
  else
    echo "No error found in OS logs"
  fi
}

get_errors "$error_path"
