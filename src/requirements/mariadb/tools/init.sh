# 데이터베이스 생성
CREATE DATABASE IF NOT EXISTS ${DB1_NAME};

# 사용자 생성 및 권한 부여
CREATE USER '${DB1_USR}'@'%' IDENTIFIED BY '${DB1_PWD}'; # 새로운 MariaDB 사용자 계정 생성 (%: 해당 사용자가 모든 호스트에서 접근 가능)
GRANT ALL PRIVILEGES ON ${DB1_NAME}.* TO '${DB1_USR}'@'%'; # 데이터 베이스 사용자에게 특정 데이터베이스에 대한 모든 권한 부여
FLUSH PRIVILEGES; # 변경 사항 즉시 반영

USE ${DB1_NAME}; # SQL 명령이 실행될 기본 데이터베이스 설정
CREATE TABLE IF NOT EXISTS test_table (
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
# test_table이라는 이름의 테이블 생성
# id는 INT형, 테이블의 기본키를 사용
# name은 최대 255자의 문자열을 저장 가능
# 행이 삽입될 때 자동으로 생성시간 기록