#!/bin/sh

MY_NETWORK="$(echo "${LOCAL_IP_ADDRESS}" | awk '{split($1,p,"."); $1=p[1]"."p[2]"."p[3]"."0} 1')"

echo "/media/nfs	${MY_NETWORK}/24(rw,no_root_squash,sync,no_subtree_check)">/etc/exports

sudo service rpcbind restart
sudo exportfs -ra
sudo service nfs-kernel-server restart 

mylogger "nfs set up!"

service tftpd-hpa restart
mylogger "TFTP set up!"

