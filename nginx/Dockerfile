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
RUN  wget https://wordpress.org/latest.tar.gz &&  tar -xzvf latest.tar.gz && rm latest.tar.gz && mv wordpress/* /var/www/inception/htdocs/wordpress

RUN echo "<h1>NGINX with TLSv1.2 on inception</h1>" > /var/www/inception/htdocs/index.html

COPY conf /etc/nginx/http.d/default.conf


CMD ["nginx", "-g", "daemon off;"]

EXPOSE 80 443
