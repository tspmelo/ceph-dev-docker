#!/bin/bash

set -e

cd /ceph/src/pybind/mgr/dashboard/frontend
source /ceph/build/src/pybind/mgr/dashboard/node-env/bin/activate

# current branch coverage
BRANCH=`git rev-parse --abbrev-ref HEAD`

npm i
npm run test:ci
cp coverage/cobertura-coverage.xml coverage/branch-coverage.xml

git checkout master
npm i
npm run test:ci
cp coverage/cobertura-coverage.xml coverage/master-coverage.xml

git checkout $BRANCH

pycobertura diff coverage/master-coverage.xml coverage/branch-coverage.xml