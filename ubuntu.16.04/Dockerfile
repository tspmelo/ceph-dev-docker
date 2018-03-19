FROM ubuntu:16.04
MAINTAINER Ricardo Marques "rimarques@suse.com"

RUN apt-get update

RUN apt-get install \
        git ccache aptitude

ADD ../setup-ceph.sh /root/bin/setup-ceph
ADD ../bash.bashrc /etc/bash.bashrc

VOLUME ["/ceph"]

CMD /bin/bash
