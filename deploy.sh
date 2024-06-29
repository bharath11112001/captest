#!/bin/bash

# Determine the branch name from environment variables or fallback to current Git branch
GIT_BRANCH=${GIT_BRANCH:-$(git rev-parse --abbrev-ref HEAD)}
echo "Deploying branch: $GIT_BRANCH"

# Define image repository
if [[ $GIT_BRANCH == "main" ]] || [[ $GIT_BRANCH == "origin/main" ]]; then
  IMAGE_TAG="bharath883/prod:latest"
elif [[ $GIT_BRANCH == "dev" ]] || [[ $GIT_BRANCH == "origin/dev" ]]; then
  IMAGE_TAG="bharath883/dev:latest"
else
  echo "Deployment failed: Unsupported branch '$GIT_BRANCH'"
  exit 1
fi

# Perform build and push
./build.sh
docker tag mynginximg "$IMAGE_TAG"
docker push "$IMAGE_TAG"

