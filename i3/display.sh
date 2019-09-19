#!/usr/bin/env bash

PRIMARY_MONITOR="${1}"
SECONDARY_MONITOR="${2}"

if xrandr | grep -q "${SECONDARY_MONITOR} disconnected"; then
  xrandr --output "${SECONDARY_MONITOR}" --off
else
  xrandr --output "${SECONDARY_MONITOR}" --auto
  xrandr --output "${SECONDARY_MONITOR}" --left-of "${PRIMARY_MONITOR}"
fi

feh --bg-fill $HOME/wallpapers/gastly.jpg

