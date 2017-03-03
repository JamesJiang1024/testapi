#!/bin/bash

echo "Delete Online Test Usecase"
for i in `oc get all | grep testapi-v | grep -v 'rc' | awk '{print $1}'`;do oc delete $i;sleep 5;done
