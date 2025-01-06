FROM debian:bullseye

RUN apt-get update -y && apt-get install mariadb-server -y

COPY ./tools/start.sh /root/script/
COPY ./tools/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN chmod +x root/script/start.sh

CMD ["./root/script/start.sh"]