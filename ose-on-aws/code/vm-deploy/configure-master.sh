#!/bin/bash

# Enable HA repo on EACH MASTER

subscription-manager repos --enable="rhel-ha-for-rhel-7-server-rpms"


# Install EPEL and Ansible
yum -y install \
    http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm

sed -i -e "s/^enabled=1/enabled=0/" /etc/yum.repos.d/epel.repo

yum -y --enablerepo=epel install ansible


# Clone the branch
git clone https://github.com/detiber/openshift-ansible.git

# Then copy over the hosts file and deploy the playbook.

mv -f /etc/ansible/hosts-ha_branch /etc/ansible/hosts


ansible-playbook ~/openshift-ansible/playbooks/byo/config.yml






# After deployment, create users for testing

useradd joe
useradd alice

touch /etc/openshift/openshift-passwd
htpasswd -b /etc/openshift/openshift-passwd joe redhat
htpasswd -b /etc/openshift/openshift-passwd alice redhat

# modify /etc/openshift/master/master-config.yaml


identityProviders:
- challenge: true
  login: true
  name: htpasswd_auth
  provider:
    apiVersion: v1
    file: /etc/openshift/openshift-passwd
    kind: HTPasswdPasswordIdentityProvider


