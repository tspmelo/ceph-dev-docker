FROM fedora:27
MAINTAINER Ricardo Marques "rimarques@suse.com"

RUN dnf upgrade -y
RUN dnf install -y \
        git dnf-plugins-core bash vim tmux ccache bzip2 \
        findutils python3-prettytable python3-pyOpenSSL \
        python3-cherrypy python3-jwt python3-bcrypt python3-pecan \
        python3-requests python3-werkzeug

ADD bin/ /bin/
ADD bash.bashrc /etc/bash.bashrc

VOLUME ["/ceph"]

CMD /bin/bash
