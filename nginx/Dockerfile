FROM alpine:3.14
RUN apk add nginx openssl openrc && apk update

RUN mkdir -p /run/openrc

RUN touch /run/openrc/softlevel

RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout /etc/nginx/ssl/inception.key \
  -out /etc/nginx/ssl/inception.crt \
  -subj "/CN=inception" \
  -addext "subjectAltName=DNS:inception,IP:127.0.0.1"
RUN mkdir -p /var/www/inception/htdocs/wordpress

  RUN addgroup -g 82 -S www-data || true && \
    adduser -u 82 -D -S -G www-data www-data || true && \
    chown -R www-data:www-data /var/www/inception/htdocs/wordpress && \
    chmod -R 755 /var/www/inception/htdocs/wordpress

COPY ./conf/conf /etc/nginx/http.d/default.conf

CMD ["nginx", "-g", "daemon off;"]

EXPOSE 80 443
