FROM debian:bullseye

# 필요한 패키지 설치
RUN apt-get update -y && \
    apt-get install mariadb-server -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# 컨테이너 시작 시 실행할 스크립트 복사
COPY ./tools/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tools/start.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/start.sh

# 컨테이너 시작 시 MariaDB 실행
CMD ["start.sh"]
