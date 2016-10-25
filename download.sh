#!/bin/bash

echo $YOUTUBE

cd /tmp

youtube-dl --audio-format mp3 -x "$YOUTUBE"
touch /tmp/ready

while true;
do
  sleep 1
  [[ ! -f /tmp/ready ]] && exit 0
done
