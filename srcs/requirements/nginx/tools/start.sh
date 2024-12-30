#!/bin/bash

# self-signed certification create
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
-keyout /etc/ssl/private/nginx-selfsigned.key \
-out $CERTS \
-subj "/C=KR/ST=Seoul/L=Seoul/O=MyCompany/OU=IT/CN=localhost"

# server setting
echo " 
server {
	listen 443 ssl;
	listen [::]:443 ssl;

	server_name localhost;

	ssl_certificate $CERTS;
	ssl_certificate_key /etc/ssl/private/nginx-selfsigned.key;

	ssl_protocols TLSv1.3;

	location / {
		root /usr/share/nginx/html;
		index index.html;
	}
}
" > /etc/nginx/sites-available/default