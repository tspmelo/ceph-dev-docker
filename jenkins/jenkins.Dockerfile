FROM ubuntu:bionic
LABEL maintainer="rimarques@suse.com"

RUN apt-get update
RUN apt-get install -y gnupg apt-utils curl ccache python3-yaml


ADD /jenkins /jenkins

# Chrome
RUN /jenkins/install-e2e-test-deps.sh
# ENV CHROME_BIN /usr/bin/google-chrome

ENV CEPH_ROOT /ceph
ENV PATH="/shared/bin/jenkins:/shared/bin:${PATH}"

VOLUME ["/ceph"]
VOLUME ["/shared"]

CMD ["bash"]
