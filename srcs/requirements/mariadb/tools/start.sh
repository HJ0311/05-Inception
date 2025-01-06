#!/bin/bash

service mysql start

mysqld_safe --datadir=/var/lib/mysql --socket=/run/mysqld/mysqld.sock &

sleep 10

echo "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};" > db1.sql
echo "CREATE USER IF NOT EXISTS '${MYSQL_ROOT_USER}'@'%' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';" >> db1.sql
echo "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_ROOT_USER}'@'%';" >> db1.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '12345' ;" >> db1.sql
echo "FLUSH PRIVILEGES;" >> db1.sql

mysqladmin -u root -p $MYSQL_ROOT_PASSWORD shutdown

mysqld
