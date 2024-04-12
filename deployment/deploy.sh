#!/bin/bash

IMAGE_NAME="buckeyechase135/chase_project4_image"
CONTAINER_NAME="chase_image"

# Stop and remove the existing container
echo "Stopping and removing the existing container..."
docker stop $CONTAINER_NAME
docker rm $CONTAINER_NAME

# Pull the latest image
echo "Pulling the latest image from DockerHub..."
docker pull $IMAGE_NAME

# Run the new container
echo "Starting the updated container..."
docker run -d -p 80:80 --name $CONTAINER_NAME --restart always $IMAGE_NAME

echo "Container updated successfully."
