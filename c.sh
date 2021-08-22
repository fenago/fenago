rm /tmp/ssh.tar
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
chmod 700 ~/.ssh/
chmod 600 ~/.ssh/id_rsa.pub
chmod 600 ~/.ssh/id_rsa
chmod 600 ~/.ssh/authorized_keys

ssh-keyscan 1.1.1.101 1.1.1.102 1.1.1.111 1.1.1.112 1.1.1.113 1.1.1.114 1.1.1.115 1.1.1.116 1.1.1.117 1.1.1.118  >> /var/lib/one/.ssh/authorized_keys

ssh-keyscan 1.1.1.101 1.1.1.102 1.1.1.111 1.1.1.112 1.1.1.113 1.1.1.114 1.1.1.115 1.1.1.116 1.1.1.117 1.1.1.118 >> /var/lib/one/.ssh/known_hosts

cd ~/.ssh/
tar cvf /tmp/ssh.tar *
scp -rp /tmp/ssh.tar root@1.1.1.102:/tmp/
scp -rp /tmp/ssh.tar root@1.1.1.111:/tmp/
scp -rp /tmp/ssh.tar root@1.1.1.112:/tmp/
scp -rp /tmp/ssh.tar root@1.1.1.113:/tmp/
scp -rp /tmp/ssh.tar root@1.1.1.114:/tmp/
scp -rp /tmp/ssh.tar root@1.1.1.115:/tmp/
scp -rp /tmp/ssh.tar root@1.1.1.116:/tmp/
scp -rp /tmp/ssh.tar root@1.1.1.117:/tmp/
scp -rp /tmp/ssh.tar root@1.1.1.118:/tmp/


# scp -rp /var/lib/one/.ssh 1.1.1.102:/var/lib/one/

chmod 700 /var/lib/one/.ssh
chmod 600 /var/lib/one/.ssh/id_rsa.pub
chmod 600 /var/lib/one/.ssh/id_rsa
chmod 600 /var/lib/one/.ssh/authorized_keys
chmod 600 /var/lib/one/.ssh/config
chmod a+rx /var/lib/one
chmod a+rx /var/lib/one/datastores
chmod a+rx /var/lib/one/datastores/0
# systemctl restart sshd
chown -R oneadmin:oneadmin /var/lib/one/.ssh/
#****if you run into problems - you can go to:  vi /etc/ssh/sshd_config  and set StrictModes no
#****you can also troubleshoot by doing:  ssh -vvv 1.1.1.103 (on the from box as user oneadmin) and as user root on the “to” box --- tail -f /var/log/secure
#****you can also make sure that you have disabled SELinux AND BOUNCED with a reboot
#DO NOT PROCEED UNTIL YOU CAN PASSWORDLESS SSH
#as user oneadmin on the new box:

#cat << EOT > ~/.ssh/config
#ConnectTimeout 5
#ConnectionAttempts 1
#Host *
#    StrictHostKeyChecking no
#EOT
#in /etc/ssh/sshd_config
#StrictModes no
#PermitRootLogin no

