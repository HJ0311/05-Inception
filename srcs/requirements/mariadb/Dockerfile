FROM debian:bullseye

# 필요한 패키지 설치
RUN apt-get update && \
    apt-get install -y mariadb-server mariadb-client && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# 데이터 디렉토리 생성 및 권한 설정
RUN mkdir -p /var/lib/mysql /var/run/mysqld && \
    chown -R mysql:mysql /var/lib/mysql /var/run/mysqld

# 컨테이너 시작 시 실행할 스크립트 복사
COPY ./start.sh /
RUN chmod +x /start.sh

# 포트 및 볼륨 설정
EXPOSE 3306
VOLUME ["/var/lib/mysql"]

# 컨테이너 시작 시 MariaDB 실행
CMD ["start.sh"]
