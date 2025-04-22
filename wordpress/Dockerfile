FROM alpine:latest

RUN apk add php8 php8-fpm php8-mysqli php8-phar mariadb-client php8-mbstring php8-iconv php8-tokenizer php8-session

RUN wget https://wordpress.org/latest.tar.gz && tar -xzvf latest.tar.gz && rm latest.tar.gz 

RUN ln -s /usr/bin/php8 /usr/bin/php

ADD https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar /usr/local/bin/wp-cli.phar

RUN mkdir -p /var/www/inception/htdocs/ && mv -f wordpress /var/www/inception/htdocs/ && mkdir -p /var/adminer

RUN addgroup -g 82 -S www-data 2>/dev/null || echo "Group www-data already exists" && \
    adduser -D -u 82 -G www-data www-data 2>/dev/null || echo "User www-data already exists"

RUN chown www-data:www-data /var/adminer/
RUN sed -i 's/user = nobody/user = www-data/g' /etc/php8/php-fpm.d/www.conf && \
    sed -i 's/group = nobody/group = www-data/g' /etc/php8/php-fpm.d/www.conf && \
    sed -i 's/listen = 127.0.0.1:9000/listen = 9000/g' /etc/php8/php-fpm.d/www.conf

COPY ./tools/docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh /usr/local/bin/wp-cli.phar
ENTRYPOINT ["/docker-entrypoint.sh"]
