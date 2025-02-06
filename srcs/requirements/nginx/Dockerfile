FROM debian:bullseye

RUN apt-get update -y --no-install-recommends && \
	apt-get install -y --no-install-recommends \
	nginx \
	openssl && \
	apt-get clean

COPY ./tools/start.sh /

CMD ["/start.sh"]