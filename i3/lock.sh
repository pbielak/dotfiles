#!/usr/bin/env bash

# Script based on: https://gist.github.com/csivanich/10914698

IMAGE=/tmp/i3lock.png
SCREENSHOT="scrot $IMAGE"

# All options are here: http://www.imagemagick.org/Usage/blur/#blur_args
#BLURTYPE="0x5" # 7.52s
#BLURTYPE="0x2" # 4.39s
#BLURTYPE="5x2" # 3.80s
#BLURTYPE="2x8" # 2.90s
BLURTYPE="2x3" # 2.92s

# Get the screenshot, add the blur and lock the screen with it
$SCREENSHOT
convert $IMAGE -blur $BLURTYPE $IMAGE
i3lock -i $IMAGE
rm $IMAGE

