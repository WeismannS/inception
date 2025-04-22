FROM alpine:latest


ADD https://github.com/vrana/adminer/releases/download/v5.2.1/adminer-5.2.1.php /var/adminer/index.php

RUN addgroup -g 82 -S www-data || true && \
    adduser -u 82 -D -S -G www-data www-data || true && \
    chown -R www-data:www-data /var/adminer && \
    chmod -R 755 /var/adminer

CMD ["echo", "Adminer is running on http://localhost:8080"]