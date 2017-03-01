#!/bin/bash
version=`git rev-parse HEAD | cut -b 1-6`
oc new-app --image-stream="svcrouter-test1/testapi:v1-$version" --name testapi-v1
oc create -f yml/testapi_svc.yml
