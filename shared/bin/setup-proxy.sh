#!/bin/bash

##
# You can pass a port number and it will be used in the proxy
# setup-proxy.sh 8443
##

set -e


if [[ -z "$1" ]]; then
  cd /ceph/build
  url=`./bin/ceph mgr services | jq .dashboard`
else
  url="\"https://localhost:$1/\""
fi

cd /ceph/src/pybind/mgr/dashboard/frontend
jq '.["/api/"].target'=$url proxy.conf.json.sample | jq '.["/ui-api/"].target'=$url > proxy.conf.json
