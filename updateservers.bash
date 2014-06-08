#!/bin/bash

source passwords.sh

ansible-playbook -i hosts all.yml