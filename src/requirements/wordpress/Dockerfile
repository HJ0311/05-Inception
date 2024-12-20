FROM debian:bullseye

RUN apt-get -y update && apt-get install -y php-fpm php-mysql && rm -rf /var/lib/apt/lists/*

COPY wp-config.php /var/www/html/

CMD ["php-fpm", "-F"]