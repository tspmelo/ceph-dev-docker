FROM fedora:26
MAINTAINER Ricardo Marques "rimarques@suse.com"

RUN dnf install \
        git dnf-plugins-core bash vim tmux ccache bzip2

ADD ../setup-ceph.sh /root/bin/setup-ceph
ADD ../bash.bashrc /etc/bash.bashrc

VOLUME ["/ceph"]

CMD /bin/bash
