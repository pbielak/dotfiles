#!/usr/bin/env bash

function push_notification {
  msg="${1}"
  notify-send --expire-time=1000 \
              --hint=string:x-dunst-stack-tag:volume \
              "Volume" "${msg}"
}

function change_volume {
  value="${1}"
  amixer set Master -q "${value}"

  current_volume="$(amixer get Master | grep -m 1 -Po '\d+\%')"
  push_notification "Current volume: ${current_volume}"
}

function mute {
  amixer set Master -q toggle

  state="$(amixer get Master | grep -m 1 -Po '\[o(n|ff)\]')"
  echo "${state}"
  if [ "${state}" = "[on]" ]; then
    push_notification "Audio unmuted"
  else
    push_notification "Audio muted"
  fi
}

function mic_mute {
  amixer set Capture -q toggle

  state="$(amixer get Capture | grep -m 1 -Po '\[o(n|ff)\]')"
  echo "${state}"
  if [ "${state}" = "[on]" ]; then
    push_notification "Microphone unmuted"
  else
    push_notification "Microphone muted"
  fi
}


ACTION="${1}"

case "${ACTION}" in
  "CHANGE") change_volume ${2} ;;
  "MUTE") mute ;;
  "MICMUTE") mic_mute ;;
esac

