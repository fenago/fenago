yum -y install epel-release
yum -y install fail2ban net-tools shellinabox bridge-utils wget curl nmap nfs-utils collectl nload net-tools collectl ifconfig bind-utils lm_sensors

cat << EOT > /etc/sysconfig/network-scripts/ifcfg-br0
DEVICE=br0
TYPE=Bridge
IPADDR=1.1.1.118
NETMASK=255.255.255.0
ONBOOT=yes
BOOTPROTO=static
NM_CONTROLLED=no
ZONE=public

EOT

cat << EOT > /etc/sysconfig/network-scripts/ifcfg-em2
DEVICE=em2
BOOTPROTO=none
NM_CONTROLLED=no
ONBOOT=yes
TYPE=Ethernet
BRIDGE=br0

EOT


cat << EOT > /etc/fail2ban/jail.local
#update here to add /etc/fail2ban/jail.local with this content

[DEFAULT]
# Ban hosts for one hour:
bantime = 7200

# Override /etc/fail2ban/jail.d/00-firewalld.conf:
banaction = iptables-multiport

[sshd]
enabled = true
EOT

systemctl start fail2ban
systemctl enable fail2ban

hostnamectl set-hostname fc118.fusionclouds.com --static
hostnamectl status

sed -i 's/enforcing/disabled/g' /etc/selinux/config

systemctl restart libvirtd
systemctl enable libvirtd

ifdown br0;ifdown em2;ifup br0;ifup em2

brctl addbr br0
brctl addif br0 em2
useradd -m super;useradd -m fc38664
dmesg | grep kvm  # cd /var/log
/usr/libexec/qemu-kvm --version
virsh capabilities
virt-host-validate
firewall-cmd --permanent --add-service=nfs
firewall-cmd --permanent --add-service=mountd
firewall-cmd --permanent --add-service=rpc-bind
firewall-cmd --reload
systemctl enable nfs
systemctl enable rpcbind
systemctl start nfs
systemctl start rpcbind
brctl show
# showmount -e 1.1.1.113   # This will show you if you can connect

