#!/bin/bash

tar -xzf sleepservice.tar.gz

touch /var/log/sleeplog.log
cp sleeplog.sh /usr/bin/sleeplog.sh
cp rsleep.sh /usr/bin/rsleep.sh
cp sleep.service /etc/systemd/system/taun.service

rm sleeplog.sh rsleep.sh sleep.service 

systemctl daemon-reload

systemctl start taun

