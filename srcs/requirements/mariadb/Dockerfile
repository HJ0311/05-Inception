FROM debian:bullseye

RUN apt-get update -y && apt-get -y install mariadb-server

RUN mkdir -p /var/run/mysqld && mkdir -p /run/mysqld
RUN chown -R mysql:mysql /run/mysqld && chown -R mysql:root /var/run/mysqld

COPY tools/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY tools/start.sh /

CMD ["/start.sh"]