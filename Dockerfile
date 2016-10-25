FROM centos:7

RUN yum install -y python python-setuptools && easy_install youtube-dl
ADD download.sh /
ADD https://johnvansickle.com/ffmpeg/releases/ffmpeg-release-64bit-static.tar.xz /tmp
RUN tar xJf /tmp/ffmpeg-release-64bit-static.tar.xz -C /tmp

CMD /bin/bash /download.sh
