touch /home/fw.sh
chmod 755 /home/fw.sh
cat << EOT > /home/fw.sh
touch /tmp/fw_guac.txt
# netstat -tupln | grep qemu-kvm-one | awk '{print $4}' | sed -e 's/:.*//' # gives IP only
netstat -tupln | grep qemu-kvm-one | awk '{print $4}' | sed -e 's/.*://' > /tmp/fw_guac.txt
cat /tmp/fw_guac.txt
date > /tmp/cronlog
for i in `cat /tmp/fw_guac.txt`
 do
    firewall-cmd --add-port=$i/tcp
    firewall-cmd --zone=docker --add-port=$i/tcp
    echo $i
    echo "Above port is opened"
    firewall-cmd --query-port=$i/tcp
    echo $i >> /tmp/cronlog
  done

rm /tmp/fw_guac.txt

# firewall-cmd --remove-port=3306/tcp
# firewall-cmd --zone=public --add-service=smtp
# firewall-cmd --zone=public --permanent --add-port=6990-7000/tcp
# firewall-cmd --zone=public --permanent --add-port=7000/tcp
# firewall-cmd --list-all-zones
firewall-cmd --list-ports
# systemctl restart firewalld

EOT

cat << EOT > /tmp/crontab.txt
*/5 * * * * /home/fw.sh
EOT

crontab /tmp/crontab.txt

scp -rp /tmp/g.sh root@1.1.1.102:/tmp/
scp -rp /tmp/g.sh root@1.1.1.111:/tmp/
scp -rp /tmp/g.sh root@1.1.1.112:/tmp/
scp -rp /tmp/g.sh root@1.1.1.113:/tmp/
scp -rp /tmp/g.sh root@1.1.1.114:/tmp/
scp -rp /tmp/g.sh root@1.1.1.115:/tmp/
scp -rp /tmp/g.sh root@1.1.1.116:/tmp/
scp -rp /tmp/g.sh root@1.1.1.117:/tmp/
scp -rp /tmp/g.sh root@1.1.1.118:/tmp/
echo “****ALL FILES PUSHED****”
touch /home/fw.sh
