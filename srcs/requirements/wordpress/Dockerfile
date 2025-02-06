FROM debian:bullseye

# lsb-release: Provides information for distribution
# apt-transport-https, ca-certificates: Packages that enables package download over HTTPS
# curl, gnupg: Tools that enable get GPG key from external repository
RUN apt-get update -y && \
	apt-get install -y --no-install-recommends lsb-release apt-transport-https ca-certificates curl gnupg && \
	rm -rf /var/lib/apt/lists/* && apt-get clean

# Get GPG key from PHP package storage and add PHP storage in /etc/apt/sources.list.d/php.list for installing PHP related packages
RUN curl -fsSL https://packages.sury.org/php/apt.gpg | gpg --dearmor -o /usr/share/keyrings/php-archive-keyring.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/php-archive-keyring.gpg] https://packages.sury.org/php/ $(. /etc/os-release && echo $VERSION_CODENAME) main" \
    | tee /etc/apt/sources.list.d/php.list

# mysql: Module for connection MYSQL and PHP
# fpm: PHP-FPM
# gd: handles image function
# cli: PHP cmd interface
# mbstring: Module for handling multi-language 
RUN apt-get update && apt-get -y install --no-install-recommends \
    php8.2 \
    php8.2-mysql \
    php8.2-fpm \
    php8.2-gd \
    php8.2-cli \
    php8.2-mbstring

RUN rm -rf /var/lib/apt/lists/*

# A tool that allows users to interact directly with Wordpress sites using commands from a text based interface
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp

# Copy PHP-FPM configuration file
COPY ./conf/www.conf /etc/php/8.2/fpm/pool.d/

COPY ./tools/init_wordpress.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/init_wordpress.sh

# Execute script when container start
ENTRYPOINT ["/usr/local/bin/init_wordpress.sh"]

# Set work directory
WORKDIR /var/www/html/

EXPOSE 9000