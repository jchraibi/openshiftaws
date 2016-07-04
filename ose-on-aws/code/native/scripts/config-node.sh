echo FLANNEL_ETCD="http://172.16.13.3:2379,http://172.16.13.4:2379,http://172.16.13.5:2379" >> /etc/sysconfig/flanneld
vim /etc/sysconfig/flanneld
systemctl enable flanneld; systemctl start flanneld
systemctl enable docker; systemctl start docker
reboot
cat /etc/sysconfig/flanneld 
systemctl restart network
systemctl status flanneld
systemctl restart flanneld
systemctl restart network
reboot
setenforce 0
systemctl enable kube-proxy kubelet; systemctl start kube-proxy kubelet
