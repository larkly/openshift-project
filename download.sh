#!/bin/bash

echo $YOUTUBE

HOME=/tmp

cd /tmp

mv /tmp/ffmpeg*/ffmpeg /tmp
PATH=$PATH:/tmp

youtube-dl --audio-format mp3 -x "$YOUTUBE"
touch /tmp/ready

while true;
do
  sleep 1
  [[ ! -f /tmp/ready ]] && exit 0
done
