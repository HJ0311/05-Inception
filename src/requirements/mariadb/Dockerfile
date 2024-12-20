# Debian bullseye로 빌드
FROM debian:bullseye

# 필요한 패키지 설치
RUN apt-get -y update && apt install -y mariadb-server mariadb-client

# 포트 노출
EXPOSE 3306

# MariaDB 데이터 디렉토리 및 권한 설정 (파일 권한을 mysql 사용자 및 그룹으로 설정해 db 서버가 접근할 수 있도록 함)
RUN mkdir -p /var/lib/mysql && chown -R mysql:mysql /var/lib/mysql && chmod -R 755 /var/lib/mysql

# MariaDB 주요 설정 파일 덮어쓰기
COPY ./tools/my.cnf /etc/mysql/my.cnf

# 컨테이너 시작 시 MariaDB 실행
CMD ["mysqld"]