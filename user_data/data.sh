#!/bin/bash

apt update -y
apt install apache2 -y
service apache2 start
systemctl enable apache2
chkconfig apache2 on
echo "welcome to mr dinesh">/var/www/html/index.html
