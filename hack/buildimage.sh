#!/bin/bash
version=`git rev-parse HEAD | cut -b 1-6`
rm -rf .output/*
bee pack
mv testapi.tar.gz .output/
tar -zxvf .output/testapi.tar.gz -C .output/
sudo docker build -t testapi:v1-$version .
