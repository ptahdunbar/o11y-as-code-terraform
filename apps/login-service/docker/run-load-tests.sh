#!/bin/bash
echo "Starting request loop"

# load the PORT from the .env file
eval "$(grep ^PORT= .env)"

while true; do
  echo http://localhost:${PORT}/
  curl --silent http://localhost:${PORT}/
  
  # random sleep between 1 and 10 seconds
  sleep $((1 + $RANDOM % 10))

  echo http://localhost:${PORT}/health
  curl --silent http://localhost:${PORT}/health
  # random sleep between 1 and 10 seconds
  sleep $((1 + $RANDOM % 10))

  echo http://localhost:${PORT}/health
  curl --silent http://localhost:${PORT}/health
done
