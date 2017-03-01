#!/bin/bash
for i in `oc get all | grep testapi | awk '{print $1}'`;do oc delete $i;done
