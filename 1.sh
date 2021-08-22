systemctl status nfs
df -h
echo "Note the Mounted on column and to decide which file system to mount (hint... the largest...usually home)"
echo "-----------------------"
hostname
now=$(date +"%m%d%Y%H%M%S")
printf "Please input the short host name (i.e.: fc47) of this Server: "
read SERVERNAME
echo $SERVERNAME
 
ls /var/lib/one/datastores/
printf "Please input the Datastore number (it will probably be the highest number plus one): "
read DS
echo $DS
df -h
echo "Press Enter: "
read x
 
#/home should be selected usually since it will have the most space.
mkdir /home/$SERVERNAME/
mkdir /home/${SERVERNAME}/$DS
chown oneadmin /home/$SERVERNAME
chgrp oneadmin /home/$SERVERNAME
chown oneadmin /home/$SERVERNAME/$DS
chgrp oneadmin /home/$SERVERNAME/$DS
echo "ls -althr /home/$SERVERNAME and /home/$SERVERNAME/$DS"
ls -althr /home/$SERVERNAME
ls -althr /home/$SERVERNAME/$DS
 
echo "MOUNT directory created"


echo "Make sure to have /var/lib/one on the ADMIN in /etc/exports "
read x
cat << EOT >> /etc/exports
/home/$SERVERNAME *(rw,sync,no_subtree_check,root_squash)
EOT
 
echo "/etc/exports contents: "
cat /etc/exports
systemctl enable rpcbind
systemctl enable nfs-server
systemctl start rpcbind
systemctl start nfs-server
systemctl start nfs-lock
systemctl start nfs-idmap
systemctl restart nfs.service
echo "NFS Restarted"
 
firewall-cmd --permanent --zone=public --add-service=nfs
firewall-cmd --permanent --add-service vnc-server
firewall-cmd --reload
echo "FIREWALL modified"
echo "************************END************"
systemctl status nfs
df -h
echo "Note the Mounted on column and to decide which file system to mount (hint... the largest...usually home)"
echo "-----------------------"
hostname
now=$(date +"%m%d%Y%H%M%S")
printf "Please input the short host name (i.e.: fc47) of this Server: "
read SERVERNAME
echo $SERVERNAME
 
ls /var/lib/one/datastores/
printf "Please input the Datastore number (it will probably be the highest number plus one): "
read DS
echo $DS
df -h
echo "Press Enter: "
read x
 
#/home should be selected usually since it will have the most space.
mkdir /home/$SERVERNAME/
mkdir /home/${SERVERNAME}/$DS
chown oneadmin /home/$SERVERNAME
chgrp oneadmin /home/$SERVERNAME
chown oneadmin /home/$SERVERNAME/$DS
chgrp oneadmin /home/$SERVERNAME/$DS
echo "ls -althr /home/$SERVERNAME and /home/$SERVERNAME/$DS"
ls -althr /home/$SERVERNAME
ls -althr /home/$SERVERNAME/$DS
 
echo "MOUNT directory created"


echo "Make sure to have /var/lib/one on the ADMIN in /etc/exports "
read x
cat << EOT >> /etc/exports
/home/$SERVERNAME *(rw,sync,no_subtree_check,root_squash)
EOT
 
echo "/etc/exports contents: "
cat /etc/exports
systemctl enable rpcbind
systemctl enable nfs-server
systemctl start rpcbind
systemctl start nfs-server
systemctl start nfs-lock
systemctl start nfs-idmap
systemctl restart nfs.service
echo "NFS Restarted"
 
firewall-cmd --permanent --zone=public --add-service=nfs
firewall-cmd --permanent --add-service vnc-server
firewall-cmd --reload
echo "FIREWALL modified"
echo "************************END************"

