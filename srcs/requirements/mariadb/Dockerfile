FROM debian:bullseye

RUN apt-get update -y && apt-get -y install mariadb-server -y

COPY ./tools/50-server.cnf /etc/mysql/mariadb.conf.d/

COPY ./tools/start.sh /

CMD ["/start.sh"]