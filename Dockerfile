FROM centos:7

RUN yum install -y python python-setuptools && easy_install youtube-dl
ADD parser.sh /

CMD /bin/bash /parser.sh
