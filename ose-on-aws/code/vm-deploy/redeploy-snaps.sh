#!/bin/bash

# Set up array for base VMs
BASE=( \
'scollier-ose3-etcd-1' \
'scollier-ose3-etcd-2' \
'scollier-ose3-etcd-3' \
'scollier-ose3-master-1' \
'scollier-ose3-master-2' \
'scollier-ose3-master-3' \
'scollier-ose3-node-1' \
'scollier-ose3-node-2' \
)

for i in ${BASE[*]}
    do 
    virsh destroy $i-snap
    lvremove -f /dev/VM_vg/$i-snap
    lvcreate -s /dev/VM_vg/$i -L 15G -n /dev/VM_vg/$i-snap
    virsh start $i-snap
done

