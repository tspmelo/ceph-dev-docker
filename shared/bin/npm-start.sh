#!/bin/bash

##
# You can pass a port number and it will be used in the proxy
# npm-start.sh 8443
##

set -e

setup-proxy.sh $1

pushd /ceph/build
make mgr-dashboard-frontend-deps
popd

cd /ceph/src/pybind/mgr/dashboard/frontend
source /ceph/build/src/pybind/mgr/dashboard/node-env/bin/activate
npm start -- --disableHostCheck=true
