#!/bin/bash

# SSL을 생성할 폴더 권한 설정
mkdir -p /etc/ssl/certs /etc/ssl/private

# 인증서 생성
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
-keyout /etc/ssl/private/nginx-selfsigned.key \
-out $CERTS \
-subj "/C=KR/ST=Seoul/L=Seoul/O=MyCompany/OU=IT/CN=localhost" || echo "OpenSSL 명령어 실행 실패"

# SSL 관련 설정
echo " 
server {
    listen 443 ssl;
    ssl_protocols TLSv1.3;

    ssl_certificate $CERTS;
    ssl_certificate_key /etc/ssl/private/nginx-selfsigned.key;

    root /var/www/html;
    server_name ${DOMAIN_NAME};
    index index.php index.html index.htm;

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass wordpress:9000;
    }
}
" >> /etc/nginx/sites-available/default

# 심볼릭 링크 생성
if [ ! -L /etc/nginx/sites-enabled/default ]; then
    ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/
fi

# 설정 테스트 후 nginx 포어그라운드 실행
nginx -t && nginx -g "daemon off;"
