FROM debian:bullseye

RUN apt-get update && \
	apt-get install -y nginx openssl && \
	apt-get clean

RUN mkdir /etc/nginx/ssl && \
	openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
	-out /etc/nginx/ssl/hyehan.crt \
	-keyout /etc/nginx/ssl/hyehan.key \
	-subj "/C=KR/ST=Seoul/L=Seoul/O=42 School/OU=hyehan/CN=hyehan"

COPY ./conf/index.html /usr/share/nginx/html/index.html

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

RUN mkdir -p /run/nginx

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]