#!/bin/bash

service mysql start

echo "CREATE DATABASE IF NOT EXISTS $db1_name ;" > db1.sql # 데이터베이스 생성
echo "CREATE USER IF NOT EXISTS '$db1_user'@'%' IDENTIFIED BY $db1_pwd ;" >> db1.sql # 사용자 생성, 비밀번호 설정. %는 모든 호스트에서 접근 가능을 의미
echo "GRANT ALL PRIVILEGES ON $db1_name.* TO '$db1_user'@'%' ;" >> db1.sql # user 계정에 데이터베이스에 대한 모든 권한을 부여
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '12345' ;" >> db1.sql # root 사용자 비번 12345ㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐ
echo "FLUSH PRIVILEGES;" >> db1.sql # MariaDB에서 변경된 권한 설정을 적용

mysql < db1.sql

kill $(cat /var/run/mysqld/mysqld.pid)

mysqld