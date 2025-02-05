#!/bin/bash

echo "
server {
	listen 443 ssl;
	listen [::]:443 ssl;

	server_name www.$DOMAIN_NAME $DOMAIN_NAME;

	ssl_certificate /etc/nginx/ssl/hyehan.crt;
	ssl_certificate_key /etc/nginx/ssl/hyehan.key;

	ssl_protocols TLSv1.2 TLSv1.3;

	root /var/www/html;
	index index.php;

	location ~ [^/]\.php(/|$) {
		try_files $uri $rui =404;
		fastcgi_pass wordpress:9000;
		include fastcgi_params;
		fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
	}
}
" > /etc/nginx/sites-available/default

nginx -g "daemon off;"
