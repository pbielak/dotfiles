#!/usr/bin/env bash

# Needed for Discord connection to notification daemon
if [[ -z "$DBUS_SESSION_BUS_ADDRESS" ]]; then
  eval "$(dbus-launch --sh-syntax --exit-with-session)"
  export DBUS_SESSION_BUS_ADDRESS
fi

/run/current-system/sw/bin/Discord

