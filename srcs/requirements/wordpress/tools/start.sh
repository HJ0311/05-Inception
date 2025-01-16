#!/bin/bash

mkdir -p /var/www
mkdir -p /var/www/html

cd /var/www/html

if [ "$(pwd)" = "/var/www/html" ]; then
    rm -rf *
fi

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar || { echo "Failed to download wp-cli"; exit 1; }

chmod +x wp-cli.phar 

mv wp-cli.phar /usr/local/bin/wp


wp core download --allow-root

echo "moving file"

mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

ls /var/www/html

mv /wp-config.php /var/www/html/wp-config.php

echo "complete moving"

sed -i -r "s/db1/$MYSQL_DATABASE/1"   wp-config.php
sed -i -r "s/user/$MYSQL_USER/1"  wp-config.php
sed -i -r "s/pwd/$MYSQL_PASSWORD/1"    wp-config.php

wp core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root

wp user create $WP_USER $WP_USER_EMAIL --role=author --user_pass=$WP_USER_PASSWORD --allow-root

sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/g' /etc/php/7.4/fpm/pool.d/www.conf

/usr/sbin/php-fpm7.4 -F