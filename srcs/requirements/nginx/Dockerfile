FROM debian:bullseye

RUN apt-get update -y && \
	apt-get install -y --no-install-recommends \
	nginx \
	openssl && \
	apt-get clean

RUN mkdir -p /etc/nginx/ssl && \
	openssl req -newkey rsa:4096 -x509 -days 365 -nodes \
	-out /etc/nginx/ssl/hyehan.crt \
	-keyout /etc/nginx/ssl/hyehan.key \
	-subj "/C=KR/ST=Seoul/L=Seoul/O=42 School/OU=hyehan/CN=hyehan.42.fr"

COPY ./conf/nginx.conf /etc/nginx/conf.d

# RUN mkdir -p /run/nginx

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]