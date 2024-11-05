#!/bin/bash

echo "Starting deployment..."

# Prompt for input
read -p "Enter app name: " app_name
read -p "Enter app tag: " tag_name
read -p "Enter host port: " host_port
read -p "Enter container port: " container_port

# Check if any input is empty
if [[ -z "$app_name" || -z "$tag_name" || -z "$host_port" || -z "$container_port" ]]; then
    echo "Error: All inputs are required."
    exit 1
fi

# Get the current branch name
current_branch=$(git rev-parse --abbrev-ref HEAD)

# Pull from the current branch
git pull origin "$current_branch"

# Build Docker image
docker build -t "${app_name}:${tag_name}" .

# Stop and remove the previous container if it exists
docker stop "$app_name" || true
docker rm "$app_name" || true

# Run the container with dynamic port mapping
docker run -d --name "$app_name" -p "${host_port}:${container_port}" "${app_name}:${tag_name}"

