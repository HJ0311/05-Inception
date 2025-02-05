FROM debian:bullseye

RUN apt-get update && \
	apt-get install -y nginx openssl && \
	apt-get clean

RUN mkdir /etc/nginx/ssl && \
	openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
	-out /etc/nginx/ssl/hyehan.crt \
	-keyout /etc/nginx/ssl/hyehan.key \
	-subj "/C=KR/ST=Seoul/L=Seoul/O=42 School/OU=hyehan/CN=hyehan.42.fr"

COPY ./tools/start.sh /

CMD ["/start.sh"]