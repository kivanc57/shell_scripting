#!/bin/bash

URL="$1"

check_url(){
  # Check if parameter is provided
  if [[ -z "$URL" ]]; then
    echo "Please provide a URL as an argument to proceed..."
    exit 1
  fi
}

curl_url(){
  # Use curl to fetch only the HTTP status code
  http1_code=$(curl -s -o /dev/null -w "%{http_code}" "$URL")
}

check_request(){
  # Check if the request was successful
  if [ "$http1_code" == "200" ]; then
    echo "Request is successful..."
  else
    echo "Request has failed with HTTP status: $http1_code"
    exit 1
  fi

  # Print the HTTP status code
  echo "HTTP Status: $http1_code"
}

check_url
curl_url
check_request