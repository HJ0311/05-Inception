FROM debian:bullseye

RUN apt-get update -y  && \
	apt-get install -y mariadb-server --no-install-recommends && \
	apt-get clean

COPY ./conf/50-server.cnf /etc/mysql/mariadb/conf.d/
COPY ./tools/start.sh /

CMD ["/start.sh"]