#!/bin/bash

set -e

APP_NAME="hello"

REPO_DIR="/home/ubuntu/apps/Lab9"

IMAGE_NAME="hello-image"

CONTAINER_NAME="hello-container"

PORT=8080   # change to your app port


echo "=== Pulling latest code ==="
cd $REPO_DIR
git fetch --all

git reset --hard origin/main

echo "=== Building Docker image ==="
docker --debug build -t $IMAGE_NAME .

echo "=== Stopping old container (if exists) ==="
if [ "$(docker ps -q -f name=$CONTAINER_NAME)" ]; then
    docker stop $CONTAINER_NAME
fi

echo "=== Removing old container (if exists) ==="
if [ "$(docker ps -aq -f name=$CONTAINER_NAME)" ]; then
    docker rm $CONTAINER_NAME
fi

echo "=== Running new container ==="
docker run -d \
  --name $CONTAINER_NAME \
  -p $PORT:$PORT \
  --restart always \
  $IMAGE_NAME

echo "=== Cleaning up old images ==="
docker image prune -f

echo "=== Deployment complete ==="
