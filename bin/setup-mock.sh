#!/bin/bash

set -e

setup-proxy.sh

cd /mock-backend
source /ceph/build/src/pybind/mgr/dashboard/node-env/bin/activate
npm i

npm run start:dev
