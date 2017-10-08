#!/usr/bin/env sh

cd "$(readlink -f "$(dirname "$0")")" || exit 9

docker run -it --rm \
  --cap-add NET_ADMIN --net=host --device /dev/ttyAMA0 \
  -v ${PWD}/config:/config:ro \
  pschmitt/plantgateway
