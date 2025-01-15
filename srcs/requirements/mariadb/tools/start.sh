#!/bin/bash
set -e

# mysqld_safe를 백그라운드에서 실행
mysqld_safe &

# MariaDB 초기화 대기
sleep 3

# 초기 설정: 데이터베이스 및 사용자 생성
# 1. 기본 루트 유저의 비밀번호 설정
# 2. 데이터베이스 생성
# 3. 새 유저 생성
# 4. 
mariadb -u root <<-EOF
ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};
CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';
FLUSH PRIVILEGES;
EOF

mysqladmin -u root -p$MYSQL_ROOT_PASSWORD shutdown

mysqld_safe