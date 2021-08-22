echo "Begin FeNAgO Installation"

cat << EOT > /etc/yum.repos.d/opennebula.repo

[opennebula]
name=OpenNebula Community Edition
baseurl=https://downloads.opennebula.io/repo/6.0/CentOS/7/x86_64/
#baseurl=https://downloads.opennebula.io/repo/6.0/CentOS/7/$basearch
enabled=1
gpgkey=https://downloads.opennebula.io/repo/repo.key
gpgcheck=1
repo_gpgcheck=1
EOT

yum makecache fast

yum -y install epel-release
yum -y install opennebula-node-kvm
systemctl restart libvirtd
yum -y install centos-release-qemu-ev
yum -y install qemu-kvm-ev



echo "Begin FeNAgO Installation"

cat << EOT > /etc/yum.repos.d/opennebula.repo

[opennebula]
name=OpenNebula Community Edition
baseurl=https://downloads.opennebula.io/repo/6.0/CentOS/7/x86_64/
#baseurl=https://downloads.opennebula.io/repo/6.0/CentOS/7/$basearch
enabled=1
gpgkey=https://downloads.opennebula.io/repo/repo.key
gpgcheck=1
repo_gpgcheck=1
EOT

yum makecache fast

yum -y install epel-release
yum -y install opennebula-node-kvm
systemctl restart libvirtd
yum -y install centos-release-qemu-ev
yum -y install qemu-kvm-ev




