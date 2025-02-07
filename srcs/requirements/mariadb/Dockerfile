FROM debian:bullseye

# Install mariadb server and dumb init without recommended packages, then clean up
RUN apt-get update -y && \
	apt-get install -y --no-install-recommends mariadb-server dumb-init && \
	rm -rf /var/lib/apt/lists/* && apt-get clean

# Generate mariaDB socket directory
# Change the owner of /var/run/mysql to the mysql user and group
RUN mkdir -p /var/run/mysqld && \
	chown -R mysql:mysql /var/run/mysqld && \
	chmod 777 /var/run/mysqld

COPY ./tools/script.sh /tmp/script.sh

RUN chmod +x /tmp/script.sh

# Set MariaDb to be accessible from external sources
RUN sed -i "s/127.0.0.1/0.0.0.0/" /etc/mysql/mariadb.conf.d/50-server.cnf

EXPOSE 3306

# Use dumb-init for process management optimization
# By deault, running bash or sh as CMD in a Docker container can lead to zombie processes
# Handles signal properly
ENTRYPOINT [ "/usr/bin/dumb-init", "--" ]

CMD ["/tmp/script.sh"]