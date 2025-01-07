#!/bin/sh
set -e

# mysqld_safe를 백그라운드에서 실행
mysqld_safe &

# MariaDB 초기화 대기
sleep 5

# 초기 설정: 데이터베이스 및 사용자 생성
mariadb -u root <<-EOF
CREATE DATABASE IF NOT EXISTS my_database;
CREATE USER 'my_user'@'%' IDENTIFIED BY 'my_password';
GRANT ALL PRIVILEGES ON my_database.* TO 'my_user'@'%';
FLUSH PRIVILEGES;
EOF

# 컨테이너가 종료되지 않도록 대기
wait
