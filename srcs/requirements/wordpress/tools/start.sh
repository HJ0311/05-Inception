#!/bin/bash

mkdir -p /var/www/
mkdir -p /var/www/html

cd /var/www/html

rm -rf *
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 

chmod +x wp-cli.phar 

mv wp-cli.phar /usr/local/bin/wp

wp core download --allow-root

mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

mv /wp-config.php /var/www/html/wp-config.php

sed -i -r "s/db1/$MYSQL_DATABASE/1"   wp-config.php
sed -i -r "s/user/$MYSQL_USER/1"  wp-config.php
sed -i -r "s/pwd/$MYSQL_PASSWORD/1"    wp-config.php

wp core install --url=$DOMAIN_NAME/ --title=$WORDPRESS_TITLE --admin_user=$WORDPRESS_ADMIN_USER --admin_password=$WORDPRESS_ADMIN_PASSWORD --admin_email=$WORDPRESS_EMAIL --skip-email --allow-root

wp user create $WORDPRESS_DB_USER $WORDPRESS_EMAIL --role=author --user_pass=$WORDPRESS_DB_PASSWORD --allow-root

wp theme install astra --activate --allow-root

wp plugin update --all --allow-root

sed -i 's/listen = \/run\/php\/php8.3-fpm.sock/listen = 9000/g' /etc/php/8.3/fpm/pool.d/www.conf

mkdir /run/php

/usr/sbin/php-fpm8.3 -F