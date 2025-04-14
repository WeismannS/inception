FROM alpine:3.14

RUN apk add php8-fpm mariadb-client php8-mysqli && apk update

RUN wget https://wordpress.org/latest.tar.gz && tar -xzvf latest.tar.gz && rm latest.tar.gz 

RUN mkdir -p /var/www/inception/htdocs/ && mv -f wordpress /var/www/inception/htdocs/

# Fix permissions issue - create www-data user similar to standard PHP containers
# Create group and user only if they don't exist, and ignore errors if they do.
RUN addgroup -g 82 -S www-data 2>/dev/null || echo "Group www-data already exists" && \
    adduser -D -u 82 -G www-data www-data 2>/dev/null || echo "User www-data already exists"

# Set proper permissions for WordPress files
RUN chown -R www-data:www-data /var/www/inception/htdocs/wordpress

# Configure PHP-FPM to run as www-data and listen on port 9000
RUN sed -i 's/user = nobody/user = www-data/g' /etc/php8/php-fpm.d/www.conf && \
    sed -i 's/group = nobody/group = www-data/g' /etc/php8/php-fpm.d/www.conf && \
    sed -i 's/listen = 127.0.0.1:9000/listen = 9000/g' /etc/php8/php-fpm.d/www.conf

# Create an entrypoint script to ensure permissions are always properly set

CMD ["php-fpm8", "-F"]

EXPOSE 9000
