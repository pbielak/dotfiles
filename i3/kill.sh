#!/usr/bin/env bash

APPS=( discord slack spotify )

for app in "${APPS[@]}"; do
  while pkill -0 -i "${app}"; do
    pkill -9 -i "${app}"
    sleep 0.1
  done
done
