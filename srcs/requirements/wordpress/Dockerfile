FROM debian:bullseye

# php 설치
RUN apt-get update -y && \
	apt-get install php7.4-fpm php7.4-mysql -y && \
	apt-get install curl -y && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/*

COPY ./tools/start.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/start.sh

COPY ./tools/wp-config.php /
RUN chmod 755 /wp-config.php

CMD ["start.sh"]