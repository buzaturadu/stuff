sudo iptables -t nat -A PREROUTING -p tcp --dport 1663 -j REDIRECT --to-ports 1664
