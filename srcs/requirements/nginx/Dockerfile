FROM debian:bullseye

# Install nginx and openssl without recommended packages, then clean up
RUN apt-get update -y && \
	apt-get install -y --no-install-recommends nginx openssl && \
	rm -rf /var/lib/apt/lists/* && apt-get clean

# Create SSL directory and generate self-signed certification
RUN mkdir -p /etc/nginx/ssl && \
	openssl req -newkey rsa:4096 -x509 -days 365 -nodes \
	-out /etc/nginx/ssl/hyehan.crt \
	-keyout /etc/nginx/ssl/hyehan.key \
	-subj "/C=KR/ST=Seoul/L=Seoul/O=42 School/CN=hyehan.42.fr"
# req: Requesting signed certification
# -newkey rsa:4096: Generate new 4096 bit RSA key
# -x509: Generate self-signed X.506 Certification (available without CA)
# -days 365: This certification is vaild for 365 days
# -nodes: Generate without private password(.key)
# -out: Save SSL certification file(.crt) in /etc/nginx/ssl/hyehan.crt
# -keyout: Save private key(.key) in /etc/nginx/ssl/hyehan.key
# -subj: Specify the subject of his certification
#	/C: country code
#	/ST: state information
#	/L: location information
#	/O: organization infromation
#	/CN: domain name

# Copy nginx configuration
COPY ./conf/nginx.conf /etc/nginx/conf.d

# Ensure necessary directories exist
RUN mkdir -p /run/nginx

# Expose HTTPS port
EXPOSE 443

# Start nginx in foreground
CMD ["nginx", "-g", "daemon off;"]