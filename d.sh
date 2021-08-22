hostname
now=$(date +"%m%d%Y%H%M%S")
printf "Please input the short host name (i.e.: fc47) of this Server: "
read SERVERNAME
echo $SERVERNAME

cat << EOT >> /etc/fstab
1.1.1.101:/var/lib/one /var/lib/one/ nfs soft,intr,rsize=8192
EOT
mount -a

cat << EOT >> /etc/exports
/home/$SERVERNAME *(rw,sync,no_subtree_check,root_squash)
EOT

echo "/etc/exports contents: "
cat /etc/exports
df -h
hostname
now=$(date +"%m%d%Y%H%M%S")
printf "Please input the short host name (i.e.: fc47) of this Server: "
read SERVERNAME
echo $SERVERNAME

cat << EOT >> /etc/fstab
1.1.1.101:/var/lib/one /var/lib/one/ nfs soft,intr,rsize=8192
EOT
mount -a

cat << EOT >> /etc/exports
/home/$SERVERNAME *(rw,sync,no_subtree_check,root_squash)
EOT

echo "/etc/exports contents: "
cat /etc/exports
df -h

