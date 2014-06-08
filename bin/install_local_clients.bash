#!/bin/bash

set -e
set -x

pip install --upgrade python-ceilometerclient
pip install --upgrade python-cinderclient
pip install --upgrade python-glanceclient
pip install --upgrade python-heatclient
pip install --upgrade python-keystoneclient
pip install --upgrade python-neutronclient
pip install --upgrade python-novaclient
pip install --upgrade python-swiftclient
pip install --upgrade python-troveclient
