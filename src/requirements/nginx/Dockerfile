FROM debian:bullseye

RUN apt-get -y update && apt-get install -y nginx openssl && rm -rf /var/lib/apt/lists/*

COPY ./tools/nginx.conf /etc/nginx/nginx.conf

EXPOSE 443

CMD ["nginx", "-g", "deamon off;"]