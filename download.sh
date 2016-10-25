#!/bin/bash

echo $YOUTUBE

cd /

youtube-dl --audio-format mp3 -x $YOUTUBE
touch /ready

while true;
do
  sleep 1
  [[ ! -f /ready ]] && exit 0
done
