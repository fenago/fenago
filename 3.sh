df -h
echo "-----------------------"
 
now=$(date +"%m%d%Y%H%M%S")
printf "Please input the short host name (i.e.: fc47) of the server to add the DS: "
read SERVERNAME
echo $SERVERNAME
 
printf "Please input the IP Address of the server to add the DS (use private network .. .i.e.: 1.1.1.47): "
read IPADDR
echo $IPADDR
 
ls /var/lib/one/datastores/
printf "Please input the Datastore number (it will probably be the highest one): "
read DS
echo $DS
umount /mnt/$SERVERNAME
df -h
echo "now press enter"
read x
 
mkdir /mnt/$SERVERNAME/
echo "ls -althr /mnt/SERVERNAME"
ls -althr /mnt/$SERVERNAME
mkdir /mnt/${SERVERNAME}/$DS
echo "ls -althr /mnt/SERVERNAME/DS"
ls -althr /mnt/$SERVERNAME/$DS
echo "BEFORE CHOWN/CHGRP"
chown oneadmin /mnt/$SERVERNAME
chgrp oneadmin /mnt/$SERVERNAME
chown oneadmin /mnt/${SERVERNAME}/$DS
chgrp oneadmin /mnt/${SERVERNAME}/$DS
echo "ls -althr /mnt/SERVERNAME/"
echo "ls -althr /mnt/SERVERNAME/DS"
ls -althr /mnt/$SERVERNAME
ls -althr /mnt/$SERVERNAME/$DS
echo "AFTER CHOWN/CHGRP ... now press enter"
read y
echo "MOUNT directory created Locally"
 
echo $IPADDR:/home/$SERVERNAME /mnt/$SERVERNAME nfs async,soft,intr,rsize=65536,wsize=65536 >> /etc/fstab
 
cat /etc/fstab
 
mount /mnt/$SERVERNAME
mount | grep $SERVERNAME
 
df -h
 
#ln -s /mnt/$SERVERNAME/$DS /var/lib/one/datastores/$DS
systemctl restart nfs.service
#echo "The Error that says Link Exists is OK"
