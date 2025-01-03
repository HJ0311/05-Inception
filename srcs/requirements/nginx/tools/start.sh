#!/bin/bash

mkdir -p /etc/ssl/certs /etc/ssl/private

# self-signed certification create
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
-keyout /etc/ssl/private/nginx-selfsigned.key \
-out /etc/ssl/certs/nginx-selfsigned.crt \
-subj "/C=KR/ST=Seoul/L=Seoul/O=MyCompany/OU=IT/CN=localhost" || echo "OpenSSL 명령어 실행 실패"

# server setting
echo " 
server {
	listen 443 ssl;
	listen [::]:443 ssl;

	server_name www.$DOMAIN_NAME $DOMAIN_NAME;

	ssl_certificate /etc/ssl/certs/nginx-selfsigned.crt;
	ssl_certificate_key /etc/ssl/private/nginx-selfsigned.key;

	ssl_protocols TLSv1.2 TLSv1.3;

	location / {
		root /usr/share/nginx/html;
		index index.html;
	}
}
" > /etc/nginx/sites-available/default

ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/

nginx -g "daemon off";