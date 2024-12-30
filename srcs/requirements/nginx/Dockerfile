FROM debian:bullseye

RUN apt-get update -y && apt-get -y install nginx openssl && rm -rf /var/lib/apt/lists/*

COPY ./tools/start.sh /

CMD ["/start.sh"]