FROM debian:bullseye

RUN apt-get update -y && apt-get -y install nginx && apt install -y openssl

COPY tools/start.sh /

CMD ["/start.sh"]