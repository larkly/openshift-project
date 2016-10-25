#!/bin/bash

if [ $# -ne 1 ]; then
  echo "Usage: $(basename $0) <list-uri>" 1>&2
  exit 1
fi

file=/tmp/tmp.tmp
list=$1
output=/tmp/files

# Sanity check
youtube-dl --flat-playlist -j "$list" > $file
if ! grep -q '"_type": "url",' $file; then
  echo "Error: not a playlist" 1>&2
  exit 1
fi

cont=()
for v in $(sed -e 's/^.*Youtube", "id": "//g' -e 's/", "title.*$//g' < $file); do
  #echo "https://www.youtube.com/watch?v=$v"
  oc new-app https://github.com/larkly/openshoft-project.git --param=YOUTUBE="https://www.youtube.com/watch?v=$v" --name=$v
  cont+=($v)
done

mkdir -p $output
while true; do
  working=()
  for c in ${cont[@]}; do
    oc exec $c -it test -f /ready
    if [ $? -ne 0 ]; then
      name=$(oc exec $c -it "ls /\*mp3" | tr -d '/')
      oc exec $c -it cat $name > $output/$name
      oc exec $c -it rm -f /ready
    else
      working+=($c)
    fi
  done
  cont=(${working[@]})
  [[ ${#cont} -eq 0 ]] && break
  sleep 5
done

echo "Files downloaded at $output!"
