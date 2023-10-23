#!/bin/bash

TAG="$1"
PLATFORM="$2"

echo "argument 1=$1, ${TAG}"

if [ -z "$TAG" ]; then
  echo "Please choose a version from https://github.com/v2fly/v2ray-core/releases" && exit 1
fi

echo "building v2ray image from version=${TAG}, platform=${PLATFORM}..."

if [ -z "$PLATFORM"]; then
  echo "WARN: platform is empty"
  docker build --no-cache --build-arg TAG=${TAG} -t photosys2/v2ray .
else
  docker build --no-cache --build-arg TAG=${TAG} --build-arg TARGETPLATFORM=${PLATFORM} -t photosys2/v2ray .
fi