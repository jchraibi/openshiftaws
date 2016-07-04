#!/bin/bash

# This is the output of histoy on the master1 server.

rpm -qa | grep kube
rpm -qa | grep etcd
cd /etc/kubernetes/
ls
ssh master1
ssh master2
ssh master3
vi config-etcd
ping -c1 master1
ping -c1 master2
ping -c1 master3
mv config-etcd config-etcd.sh
vi config-etcd.sh
vi config-etcd.sh 
vi config-etcd.sh 
chmod +x config-etcd.sh 
./config-etcd.sh 
cat config-etcd.sh 
systemctl enable etcd; systemctl start etcd
etcdctl cluster-health
etcdctl member-list
etcdctl member list
systemctl status etcd
etcdctl member
etcdctl mk /coreos.com/network/config '{"Network":"192.168.50.0/16","SubnetLen":24,"Backend":{"Type":"vxlan","VNI":1}}'
etcdctl get /coreos.com/network/config
subscription-manager repos --enable rhel-ha-for-rhel-7-server-rpms
yum install pcs fence-agents-all
echo hacluster | passwd -f --stdin hacluster
systemctl enable pcsd; systemctl start pcsd
pcs cluster auth -u hacluster -p hacluster 172.16.13.3 172.16.13.4 172.16.13.5
cat /etc/sysconfig/flanneld 
cat /etc/etcd/etcd.conf 
pcs cluster auth -u hacluster -p hacluster 192.168.123.100 192.168.123.101 192.168.123.102
pcs cluster
setenforce 0
pcs cluster setup --start --name high-availability-kubernetes 192.168.123.100 192.168.123.101 192.168.123.102
pcs cluster status
ping omv
pcs resource create virtual-ip IPaddr2 ip=192.168.123.3 --group master
pcs resource list
pcs resource create apiserver systemd:kube-apiserver --group master
pcs resource create scheduler systemd:kube-scheduler --group master
pcs resource create controller systemd:kube-controller-manager --group master
pcs property set stonith-enabled=false

