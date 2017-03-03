#!/bin/bash

echo "Begin to create all in on env"
echo "========================================================================================="
version=`git rev-parse HEAD | cut -b 1-6`

echo "Select app version $version and create app"
echo "========================================================================================="
echo "\n"
echo "Create new app all in one with normal http request which has 70%" 
oc new-app --image-stream="svcrouter-test1/testapi:v1-$version" --name testapi-v-1 APPVERSION=v1
echo "Create new app all in one with internal error has 20%" 
oc new-app --image-stream="svcrouter-test1/testapi:v1-$version" --name testapi-v-2 APPVERSION=v2 ERRORCODE=500
echo "Create new app all in one with timeout app 5s has 10%" 
oc new-app --image-stream="svcrouter-test1/testapi:v1-$version" --name testapi-v-3 APPVERSION=v3 TIMEWAITSEC=5

echo "Create svc routes" 
cat yml/fusing-testing.yml
oc create -f testapi-v-1-fusing.yml
oc create -f testapi-v-2-fusing.yml
oc create -f testapi-v-3-fusing.yml
oc create -f yml/fusing-testing.yml 
