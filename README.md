## schof-openstack-fromsource

Installing OpenStack from Source Code instead of OS packages or devstack.

Requires three nodes, accessible via SSH, with public key authentication already configured.

Your /etc/hosts should contain entries for the public IPs for the controller node, the network node, and the compute01 node.

You should be in a Python virtualenv for all of these steps.


### Installation Steps


1. source passwords.sh
2. ansible-playbook -i hosts all.yml
3. bin/configure_keystone.bash
4. bin/install_local_clients.bash
5. ansible-playbook -i hosts glance_on_controller.yml
6. source admin-openrc.sh
6. bin/configure_glance.bash
