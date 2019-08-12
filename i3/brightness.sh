#!/usr/bin/env bash

function push_notification {
  msg="${1}"
  notify-send --expire-time=1000 \
              --hint=string:x-dunst-stack-tag:brightness \
              "Brightness" "${msg}"
}

function change_brightness {
  value="${1}"
  xbacklight "${value}"

  current_brightness="$(xbacklight -get intel_backlight)"
  push_notification "Current: ${current_brightness}%"
}

BRIGHTNESS_DELTA="${1}"
change_brightness "${BRIGHTNESS_DELTA}"

