FROM debian:bullseye

RUN apt-get update
RUN apt-get install -y nginx openssl

RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
	-out /etc/nginx/ssl/hyehan.crt \
	-keyout /etc/nginx/ssl/hyehan.key \
	-subj "/C=KR/ST=Seoul/L=Seoul/O=42 School/OU=hyehan/CN=hyehan"

COPY ./conf/index.html /var/www/example.com/public.html/index.html
RUN chwon -R www-data: /var/www/example.com

COPY ./conf/nginx.conf /etc/nginx.conf.d

RUN mkdir -p /run/nginx

EXPOSE 443

CMD ["nginx", "-g", "deamon off;"]