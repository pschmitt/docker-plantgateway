#!/usr/bin/env bash

set -e

BT_DEV=hci0

cd "$(readlink -f "$(dirname "$0")")" || exit 9

bt_exists() {
  hciconfig 2>/dev/null | grep -q "$BT_DEV"
}

bt_init() {
  hciattach /dev/ttyAMA0 bcm43xx 921600 noflow -
}

bt_is_up() {
  hciconfig "$BT_DEV" 2>/dev/null | grep -q "UP RUNNING"
}

if ! bt_exists
then
  echo "Initializing $BT_DEV"
  if ! bt_init
  then
    echo "Retrying initialization"
    bt_init
  fi
fi

if ! bt_is_up
then
  echo "Bringing $BT_DEV up"
  hciconfig "$BT_DEV" up
  if ! bt_is_up
  then
    echo "Failed to bring $BT_DEV bluetooth interface up" >&2
    exit 2
  fi
fi

exec plantgateway

# vim: set ft=sh et ts=2 sw=2 :
