FROM debian:bullseye

RUN apt-get update && apt-get -y install mariadb-server mariadb-client && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/run/mysqld \
    && (getent group mysql || groupadd mysql) \
    && (id -u mysql || useradd -r -g mysql mysql) \
    && chown -R mysql:mysql /var/run/mysqld \
    && chmod 755 /var/run/mysqld

EXPOSE 3306