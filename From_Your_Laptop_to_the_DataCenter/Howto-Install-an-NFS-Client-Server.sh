#on the server:
 
 yum install nfs-utils rpcbind
 systemctl enable nfs-server
 systemctl enable rpcbind
  
 systemctl start rpcbind
 systemctl start nfs-server
 
 systemctl status nfs-server
 vim /etc/exports
 cat /etc/exports
      /data  <destination_host IP - USE the private IP>(rw,sync,no_wdelay)
 
 exportfs -r
 
#On the client:
 
 yum install nfs-utils
 # mount -t nfs -o ro,nosuid <your_server_ip>:/data /data   - you can skip this
 ll /data/
 # umount /data  - you can skip this
 cat /etc/fstab
<SERVER_PRIVATE_IP>:/data /data   nfs defaults        0 0
