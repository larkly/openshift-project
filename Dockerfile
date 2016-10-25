FROM centos:7

RUN yum install -y python python-setuptools && easy_install youtube-dl
ADD download.sh /

CMD /bin/bash /download.sh
