echo "Please make sure this script is run as ONEADMIN"
 
hostname
 
printf "Please input the Server name (i.e.: fc47): "
read SERVERNAME
echo $SERVERNAME
 
#echo "/var/lib/one/datastores/ :"
#ls /var/lib/one/datastores/
echo "/home/fcXX/1XX : "
ls /home/$SERVERNAME/
printf "Please input the Datastore number to create (hint...listed above): "
read DS
echo $DS
 
#mkdir /var/lib/one/datastores/$DS
 
 
#chown oneadmin /var/lib/one/datastores/$DS
#chgrp oneadmin /var/lib/one/datastores/$DS
#echo "DataStore directory created and permissions set"
#systemctl restart nfs.service
df -h
rm /var/lib/one/datastores/$DS
ln -s /mnt/$SERVERNAME/$DS /var/lib/one/datastores/$DS
 
ls -althr /var/lib/one/datastores/
 
#firewall-cmd --permanent --add-service vnc-server
#systemctl restart firewalld.service
