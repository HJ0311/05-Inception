FROM debian:bullseye

RUN apt-get update -y && \
	apt-get install -y wget curl php php-mysql php-fpm && \
	apt-get clean

COPY ./tools/script/sh /
COPY ./conf/wp-config.php /

CMD ["/start.sh"]