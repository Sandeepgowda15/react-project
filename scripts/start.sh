#!/bin/bash

echo "Logging in to ECR..."

aws ecr get-login-password --region us-east-1 | \
docker login --username AWS --password-stdin \
089783390772.dkr.ecr.us-east-1.amazonaws.com

echo "Pulling React image..."

docker pull 089783390772.dkr.ecr.us-east-1.amazonaws.com/react-project:latest

echo "Starting React container..."

docker stop react-project 2>/dev/null || true
docker rm react-project 2>/dev/null || true

docker run -d \
  --name react-project \
  -p 80:80 \
  089783390772.dkr.ecr.us-east-1.amazonaws.com/react-project:latest

echo "React application started successfully."
