#!/bin/sh
set -e  # 오류 발생 시 스크립트 즉시 종료

mysqld_safe &

sleep 3

# 데이터베이스와 사용자 생성
mariadb -u root <<-EOF
CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};
CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';
FLUSH PRIVILEGES;
EOF

# root 비밀번호 설정
mariadb -u root <<-EOF
ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
FLUSH PRIVILEGES;
EOF

# 새로운 비밀번호로 MariaDB 종료
mysqladmin -u root -p"${MYSQL_ROOT_PASSWORD}" shutdown
