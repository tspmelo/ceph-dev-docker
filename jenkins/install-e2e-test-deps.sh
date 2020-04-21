#!/bin/bash
set -ex

if [[ ! $(arch) =~ (i386|x86_64|amd64) ]]; then
    # google chrome is only available on amd64
    exit
fi

if grep -q  debian /etc/*-release; then
    bash -c 'echo "deb [arch=amd64] https://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list'
    curl -fsSL https://dl.google.com/linux/linux_signing_key.pub | apt-key add -
    apt-get update
    apt-get install -y google-chrome-stable
    apt-get install -y python-requests python3-requests python-openssl python3-openssl python-jinja2 python3-jinja2 \
	python-jwt python3-jwt python-scipy python3-scipy python-routes python3-routes
    rm /etc/apt/sources.list.d/google-chrome.list
elif grep -q rhel /etc/*-release; then
    dd of=/etc/yum.repos.d/google-chrome.repo status=none <<EOF
[google-chrome]
name=google-chrome
baseurl=https://dl.google.com/linux/chrome/rpm/stable/\$basearch
enabled=1
gpgcheck=1
gpgkey=https://dl-ssl.google.com/linux/linux_signing_key.pub
EOF
    yum install -y google-chrome-stable
    rm /etc/yum.repos.d/google-chrome.repo
    yum install -y python-requests pyOpenSSL python-jinja2 python-jwt scipy python-routes python3-routes
fi