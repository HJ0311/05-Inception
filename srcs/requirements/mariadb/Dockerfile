FROM debian:bullseye

RUN apt-get update -y && apt-get -y install mariadb-server -y

RUN mkdir -p /var/run/mysqld && chown -R mysql:mysql /var/run/mysqld && chmod 777 /var/run/mysqld

COPY ./tools/50-server.cnf /etc/mysql/mariadb.conf.d/

COPY ./tools/start.sh /

CMD ["/start.sh"]