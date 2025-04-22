FROM alpine:latest

RUN apk add --no-cache mariadb mariadb-client

RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld && \
    mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

RUN echo -e "[mysqld]\nuser=mysql\nbind-address=0.0.0.0\nport=3306" > /etc/my.cnf.d/mariadb-server.cnf

# Create initialization script
COPY ./tools/init.sql /docker-entrypoint-initdb.d/
RUN chmod 755 /docker-entrypoint-initdb.d/init.sql

EXPOSE 3306

# Create entrypoint script
COPY ./tools/docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
