#!/bin/sh
set -e

# mysqld_safe를 백그라운드에서 실행
mysqld_safe &

# MariaDB 초기화 대기
sleep 5

# 초기 설정: 데이터베이스 및 사용자 생성
mariadb -u root <<-EOF
CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};
CREATE USER IF NOT EXISTS '${MYSQL_ROOT_USER}'@'%' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_ROOT_USER}'@'%';
CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
FLUSH PRIVILEGES;
EOF

# 컨테이너가 종료되지 않도록 대기
wait