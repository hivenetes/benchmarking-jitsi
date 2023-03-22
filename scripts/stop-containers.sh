#!/bin/bash

# Loop through all running Docker containers
for container_id in $(docker ps -q)
do
  # Stop the container
  docker stop $container_id
done
