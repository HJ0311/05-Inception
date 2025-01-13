FROM debian:bullseye

# php 설치
RUN apt-get update -y && \
	apt-get install php8.3 php8.3-fpm php8.3-mysql tar unzip -y && \
	apt-get install curl -y && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/*

RUN chmod u+w /etc/php/8.3/fpm/pool.d/www.conf && \
    sed -i 's#listen = /run/php/php8.3-fpm.sock#listen = 0.0.0.0:9000#' /etc/php/8.3/fpm/pool.d/www.conf


COPY ./tools/start.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/start.sh

CMD ["start.sh"]