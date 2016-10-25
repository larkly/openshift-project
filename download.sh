#!/bin/bash

echo $YOUTUBE

HOME=/tmp

cd /tmp

cp /tmp/ffmpeg*/ffmpeg /tmp
cp /tmp/ffmpeg*/ffprobe /tmp
PATH=$PATH:/tmp
chmod +x /tmp/ffmpeg
chmod +x /tmp/ffprobe

youtube-dl --audio-format mp3 -x "$YOUTUBE"
touch /tmp/ready

while true;
do
  sleep 1
  [[ ! -f /tmp/ready ]] && exit 0
done
