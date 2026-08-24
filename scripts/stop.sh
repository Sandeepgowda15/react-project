#!/bin/bash

echo "Stopping old React container..."

docker stop react-project || true
docker rm react-project || true

echo "Old container stopped and removed."
