#!/bin/bash

#Update centos with any patches
yum update -y --exclude=kernal

#Tools
yum install -y nano git unzip screen

#Apache
yum install -y httpd httpd-devel httpd-tools
chkconfig --add httpd
chkconfig httpd on
service httpd stop

rm -rf /var/www/html
ln -s /vagrant /var/www/html

service httpd start

# php

yum install -y php php-cli php-common php-devel php-mysql

#mysql

yum install -y mysql mysql-server mysql-devel

chkconfig --add mysqld
chkconfig mysqld on

service mysqld start

mysql -u -root -e "SHOW DATABASES";

# Download starter Content

cd /vagrant 

sudo -u vagrant wget -q https://raw.githubusercontent.com/ravishankarvasam/vagrant/master/files/index.html
sudo -u vagrant wget -q https://raw.githubusercontent.com/ravishankarvasam/vagrant/master/files/info.php
service httpd restart
