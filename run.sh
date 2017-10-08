#!/usr/bin/env sh

cd "$(readlink -f "$(dirname "$0")")" || exit 9

docker run -it --rm \
  --net=host \
  -v ${PWD}/config:/config:ro \
  pschmitt/plantgateway
