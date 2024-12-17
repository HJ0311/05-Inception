# Debian bullseye로 빌드
FROM debian:bullseye

# 필요한 패키지 설치
RUN apt-get update && apt-get -y install mariadb-server mariadb-client && apt-get clean

# MariaDB 설정 파일 덮어쓰기
COPY ./tools/50-server.cnf /etc/mysql/mariadb.conf.d/

# MariaDB 초기화 설정 자동화
COPY ./tools/script.sh /

ENTRYPOINT ["/script.sh"]