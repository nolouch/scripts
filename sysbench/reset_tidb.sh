#!/bin/bash
ANSIBLE_PATH=$HOME/tool/tidb-ansible
ansible-playbook -i ${ANSIBLE_PATH}/hosts.ini ${ANSIBLE_PATH}/cleanup_data.yml  > /dev/null
ansible-playbook -i ${ANSIBLE_PATH}/hosts.ini ${ANSIBLE_PATH}/rolling_update.yml --skip-tags deploy > /dev/null
