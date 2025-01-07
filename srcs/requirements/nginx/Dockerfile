FROM debian:bullseye

# 필요한 패키지 설치
RUN apt-get update -y && \
	apt-get install nginx -y && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/*

# 컨테이너 시작 시 실행할 스크립트 복사
COPY ./tools/start.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/start.sh

# 볼륨 설정
VOLUME [ "/var/www/html" ]

CMD ["start.sh"]