#!/bin/bash

sleep 6

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x xp-cli.phar

mv wp-cli.phar /usr/local/bin/wp

# 루트 권한 실행
cd /var/www/html && wp core download --allow-root

mv wp-config-sample.php wp-config.php

wp config set SERVER_PORT 3306 --allow-root

wp config set DB_NAME $MYSQL_DATABASE --allow-root --path=/var/www/html
wp config set DB_USER $MYSQL_USER --allow-root --path=/var/www/html
wp config set DB_PASSWORD $MYSQL_PASSWORD --allow-root --path=/var/www/html
wp config set DB_HOST $DB_HOST --allow-root --path=/var/www/html

wp core install --url=$DOMAIN_NAME --title=INCEPTION --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --allow-root --path=/var/www/html

wp user create $WP_USER --role=author --user_pass=$WP_USER_PASSWORD --allow-root --path=/var/www/html

/user/sbin/php-fpm8.3 -F