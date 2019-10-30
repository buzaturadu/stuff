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

# Tot asa nu am pus path-ul real /etc/network/interfaces la sed sa nu futez ceva din gresala

sed -i 's/'$interface' inet dhcp/'$interface' inet static\n        address '$ip'\n        netmask '$3'\n        gateway '$4'\ndns-nameservers '$5'/' interfaces



