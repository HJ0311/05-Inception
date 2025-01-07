#!/bin/bash

# Create SSL directories with proper permissions
mkdir -p /etc/ssl/certs /etc/ssl/private

# Generate self-signed certificate (ensure root permission)
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
-keyout /etc/ssl/private/nginx-selfsigned.key \
-out /etc/ssl/certs/nginx-selfsigned.crt \
-subj "/C=KR/ST=Seoul/L=Seoul/O=MyCompany/OU=IT/CN=localhost" || echo "OpenSSL 명령어 실행 실패"

# Nginx server block configuration for SSL
echo " 
server {
    listen 443 ssl;
    ssl_protocols TLSv1.2 TLSv1.3;

    ssl_certificate /etc/ssl/certs/nginx-selfsigned.crt;
    ssl_certificate_key /etc/ssl/private/nginx-selfsigned.key;

    location / {
        root /usr/share/nginx/html;
        index index.html;
    }
}
" > /etc/nginx/sites-available/default

# Create symlink for sites-enabled (if on Debian/Ubuntu)
ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/

# Reload nginx to apply changes
nginx -s reload

# Keep Nginx running in the foreground (for Docker/Container environments)
nginx -g "daemon off;"
