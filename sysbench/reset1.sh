#!/bin/bash

ansible-playbook -i $HOME/tool/tidb-ansible/hosts.ini $HOME/tool/tidb-ansible/cleanup_data.yml  > /dev/null
ansible-playbook -i $HOME/tool/tidb-ansible/hosts.ini $HOME/tool/tidb-ansible/restart_all.yml > /dev/null
