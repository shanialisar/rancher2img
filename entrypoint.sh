#!/bin/sh
if [ $# -ne 2 ]; then
  echo Usage: $0 [REGISTRY] [VERSION]
  exit 1
fi

error()
{
    echo "ERROR:" "$@" 1>&2
}

if [ ! -w /var/run/docker.sock ] || [ ! -S /var/run/docker.sock ]; then
    error Please bind mount in the docker socket to /var/run/docker.sock
    error example:  docker run -v /var/run/docker.sock:/var/run/docker.sock ...
    error Or make sure you have access to the docker socker at /var/run/docker.sock
    exit 1
fi

REGISTRY=$1
VERSION=$2

IMAGES=`curl -s -L https://github.com/rancher/rancher/releases/download/$VERSION/rancher-images.txt`

for IMAGE in $IMAGES; do
    until docker inspect $IMAGE > /dev/null 2>&1; do
        docker pull $IMAGE
    done
    docker tag $IMAGE $REGISTRY/$IMAGE
    docker push $REGISTRY/$IMAGE
done
