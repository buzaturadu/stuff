#!bin/bash/

if [ "$UID" = 0 ]; then
    echo "Proceed Master"
    else
echo "root is requred"         
exit
fi

interface=$1
ip=$2
netmask=$3
gateway=$4
nameserver=$5

echo $interface $ip $netmask $gateway $nameserver

#sa nu stric ceva din gresala am pus sa editeze fisierele copiate de mine nu direct in path-ul real /etc/netplan/50-cloud-init.yaml

sed -i 's/            dhcp4: true//' 50-cloud-init.yaml


sed -i 's/'$interface':/'$interface':\n            addresses: ['$ip']\n            netmash: '$3'\n            gateway: '$4'\n            nameservers:\n              addresses: ['$5']/' 50-cloud-init.yaml



