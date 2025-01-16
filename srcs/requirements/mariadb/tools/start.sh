#!/bin/bash

service mysql start

cat /var/lib/mysql/.setup 2> /dev/null

mysql -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE";
mysql -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'";
mysql -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%'";
mysql -e "FLUSH PRIVILEGES";
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD'";

mysql $MYSQL_DATABASE -u root -p $MYSQL_ROOT_PASSWORD

mysqladmin -u root -p $MYSQL_ROOT_PASSWORD shutdown

touch /var/lib/mysql/.setup

exec mysqld --console