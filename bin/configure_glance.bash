#!/bin/bash

set -x
set -e

keystone user-create --name=glance --pass=$GLANCE_PASS \
   --email=$GLANCE_EMAIL
keystone user-role-add --user=glance --tenant=service --role=admin

keystone service-create --name=glance --type=image --description="OpenStack Image Service"
keystone endpoint-create \
  --service-id=$(keystone service-list | awk '/ image / {print $2}') \
  --publicurl=http://controller:9292 \
  --internalurl=http://controller:9292 \
  --adminurl=http://controller:9292
  
glance image-create --name="cirros-0.3.2-x86_64" --disk-format=qcow2 \
  --container-format=bare --is-public=true \
  --copy-from http://cdn.download.cirros-cloud.net/0.3.2/cirros-0.3.2-x86_64-disk.img
  