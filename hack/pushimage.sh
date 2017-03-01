#!/bin/bash
#sudo docker tag testapi:latest registry.travelsky.com/testapi/testapi:$1
#sudo docker push registry.travelsky.com/testapi/testapi:$1 
version=v1-`git rev-parse HEAD | cut -b 1-6`

echo "Save And Push Images"
sudo docker save testapi:$version > .output/testapi.tar
scp .output/testapi.tar root@10.221.130.221:/root/
rm -rf .output/testapi.tar
ssh root@10.221.130.221 "docker load < testapi.tar"
ssh root@10.221.130.221 "docker tag testapi:$version registry.travelsky.com/testapi/testapi:$version"
ssh root@10.221.130.221 "docker push registry.travelsky.com/testapi/testapi:$version"


echo "Import Images"
oc import-image testapi:$version --confirm=true --from registry.travelsky.com/testapi/testapi:$version

echo "Begin Clean......."
for i in `sudo docker images | grep testapi | awk '{print $3}'`;do sudo docker rmi -f $i;done | grep -v "IMAGE"
