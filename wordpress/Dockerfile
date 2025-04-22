FROM alpine:3.20

RUN apk add php php-fpm php-mysqli php-phar mariadb-client \
 php-mbstring php-iconv php-tokenizer php-session wget ca-certificates && apk update

RUN wget https://wordpress.org/latest.tar.gz && tar -xzvf latest.tar.gz && rm latest.tar.gz 

ADD https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar /usr/local/bin/wp-cli.phar

RUN mkdir -p /var/www/inception/htdocs/  && mv -f wordpress /var/www/inception/htdocs/ && mkdir -p /var/adminer

RUN addgroup -g 82 -S www-data 2>/dev/null || echo "Group www-data already exists" && \
    adduser -D -u 82 -G www-data www-data 2>/dev/null || echo "User www-data already exists"

RUN chown www-data:www-data /var/adminer/
RUN sed -i 's/user = nobody/user = www-data/g' /etc/php83/php-fpm.d/www.conf && \
    sed -i 's/group = nobody/group = www-data/g' /etc/php83/php-fpm.d/www.conf && \
    sed -i 's/listen = 127.0.0.1:9000/listen = 9000/g' /etc/php83/php-fpm.d/www.conf

COPY ./tools/docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh /usr/local/bin/wp-cli.phar

ENTRYPOINT ["/docker-entrypoint.sh"]