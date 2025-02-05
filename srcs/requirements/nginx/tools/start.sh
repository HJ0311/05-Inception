#!/bin/bash

openssl req -newkey rsa:2048 -x509 -days 365 -nodes \
	-out $CERT_DIR \
	-keyout /etc/ssl/private/nginx-selfsigned.key \
	-subj "/C=KR/ST=Seoul/L=Seoul/O=42 School/OU=hyehan/CN=hyehan.42.fr"

echo "
server {
	listen 443 ssl;
	listen [::]:443 ssl;

	server_name www.$DOMAIN_NAME $DOMAIN_NAME;

	ssl_certificate $CERT_DIR;
	ssl_certificate_key /etc/ssl/private/nginx-selfsigned.key;

	ssl_protocols TLSv1.2 TLSv1.3;

	root /var/www/html;
	index index.php;
	
    location ~ [^/]\.php(/|$) { 
            try_files $uri =404;
            fastcgi_pass wordpress:9000;
            include fastcgi_params;
            fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        }
}
" > /etc/nginx/sites-available/default

nginx -g "daemon off;"
