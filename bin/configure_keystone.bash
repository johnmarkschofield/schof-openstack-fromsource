#!/bin/bash

set -x
set -e

export OS_SERVICE_TOKEN=$ADMIN_TOKEN

keystone user-create --name=admin --pass=$ADMIN_PASS --email=$ADMIN_EMAIL
keystone role-create --name=admin
keystone tenant-create --name=admin --description="Admin Tenant"
keystone user-role-add --user=admin --tenant=admin --role=admin
keystone user-role-add --user=admin --role=_member_ --tenant=admin

keystone user-create --name=demo --pass=$DEMO_PASS --email=$DEMO_EMAIL
keystone tenant-create --name=demo --description="Demo Tenant"
keystone user-role-add --user=demo --role=_member_ --tenant=demo

keystone tenant-create --name=service --description="Service Tenant"

keystone service-create --name=keystone --type=identity --description="OpenStack Identity"
keystone endpoint-create \
  --service-id=$(keystone service-list | awk '/ identity / {print $2}') \
  --publicurl=http://controller:5000/v2.0 \
  --internalurl=http://controller:5000/v2.0 \
  --adminurl=http://controller:35357/v2.0
  