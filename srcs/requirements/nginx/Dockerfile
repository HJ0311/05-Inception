FROM debian:bullseye

RUN apt-get update -y && \
	apt-get install -y nginx openssl && \
	apt-get clean

COPY ./tools/start.sh /

CMD ["/start.sh"]