#!/bin/sh

wp core download --allow-root

wp config create \
    --dbname="$MYSQL_DATABASE" \
    --dbuser="$MYSQL_USER" \
    --dbpass="$MYSQL_PASSWORD" \
    --dbhost="mariadb:3306" \
    --allow-root

echo ">> WordPress installation in progress..."
wp core install --url=$DOMAIN_NAME \
                --title="$WP_TITLE" \
                --admin_user=$WP_ADMIN_USER \
                --admin_password=$WP_ADMIN_PASSWORD \
                --admin_email=$WP_ADMIN_EMAIL \
                --skip-email \
                --allow-root
echo ">> WordPress has been installed successfully."

echo ">> Setting up an additional user..."
wp user create  $WP_USER $WP_EMAIL \
                --role=subscriber \
                --user_pass=$WP_PASSWORD \
                --allow-root
echo ">> Additional user has been created."

mkdir -p /run/php

echo ">> Preparing to launch PHP-FPM..."

echo "----------------------------------------"
echo "WordPress setup is now complete!"
echo "Visit your website at: $DOMAIN_NAME"
echo "----------------------------------------"

# Using exec replaces the shell with PHP-FPM, making it the main process.
exec /usr/sbin/php-fpm8.2 -F
