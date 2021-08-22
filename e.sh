cat << EOT >> /etc/fstab
#
#
#1.1.1.101:/var/lib/one /var/lib/one/ nfs soft,intr,rsize=8192
# 1.1.1.101:/home/fc101 /mnt/fc101 nfs async,soft,intr,rsize=65536,wsize=65536
#1.1.1.101:/var/lib/one/ /var/lib/one/ nfs soft,intr,rsize=8192,wsize=8192
1.1.1.102:/home/fc102 /mnt/fc102 nfs async,soft,intr,rsize=65536,wsize=65536
1.1.1.101:/home/fc101 /mnt/fc101 nfs async,soft,intr,rsize=65536,wsize=65536
1.1.1.114:/home/fc114 /mnt/fc114 nfs async,soft,intr,rsize=65536,wsize=65536
1.1.1.113:/home/fc113 /mnt/fc113 nfs async,soft,intr,rsize=65536,wsize=65536
1.1.1.112:/home/fc112 /mnt/fc112 nfs async,soft,intr,rsize=65536,wsize=65536
1.1.1.111:/home/fc111 /mnt/fc111 nfs async,soft,intr,rsize=65536,wsize=65536

1.1.1.115:/home/fc115 /mnt/fc115 nfs async,soft,intr,rsize=65536,wsize=65536
1.1.1.116:/home/fc116 /mnt/fc116 nfs async,soft,intr,rsize=65536,wsize=65536
1.1.1.117:/home/fc117 /mnt/fc117 nfs async,soft,intr,rsize=65536,wsize=65536
1.1.1.118:/home/fc118 /mnt/fc118 nfs async,soft,intr,rsize=65536,wsize=65536
EOT
mkdir /mnt/fc101
mkdir /mnt/fc102
mkdir /mnt/fc111
mkdir /mnt/fc112
mkdir /mnt/fc113
mkdir /mnt/fc114
mkdir /mnt/fc115
mkdir /mnt/fc116
mkdir /mnt/fc117
mkdir /mnt/fc118
mount -a
df -h

