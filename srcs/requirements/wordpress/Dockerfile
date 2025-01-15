FROM debian:bullseye

# php 설치
RUN apt-get update -y && \
	apt-get install php7.4 php7.4-fpm php7.4-mysql tar unzip -y && \
	apt-get install curl -y && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/*

RUN chmod 666 /etc/php/7.4/fpm/pool.d/www.conf && \
    sed -i 's#listen = /run/php/php7.4-fpm.sock#listen = 0.0.0.0:9000#' /etc/php/7.4/fpm/pool.d/www.conf && \
    chmod 644 /etc/php/7.4/fpm/pool.d/www.conf


COPY ./tools/start.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/start.sh

CMD ["start.sh"]