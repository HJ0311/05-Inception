FROM debian:bullseye

RUN apt-get update -y && apt-get -y install mariadb-server -y

RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld

COPY ./tools/50-server.cnf /etc/mysql/mariadb.conf.d/

COPY ./tools/start.sh /

CMD ["/start.sh"]