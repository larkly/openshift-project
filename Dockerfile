FROM ubuntu:trusty

RUN apt-get update -y && apt-get install -y python python-pip && pip install youtube-dl

CMD ./parser.sh
