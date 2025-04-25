#!/bin/sh
set -e

mysqld --user=mysql &

until mysql -e "SELECT 1"; do
  echo "MySQL is starting up..."
  sleep 1
done

if [ ! -f /var/lib/mysql/.initialized ]; then
  echo "Initializing database..."
  sed /s/REDACTED_PASS/${MYSQL_PASSWORD}/g /docker-entrypoint-initdb.d/init.sql 
  sed -i "s/REDACTED_USER/${MYSQL_USER}/g" /docker-entrypoint-initdb.d/init.sql
  mysql < /docker-entrypoint-initdb.d/init.sql
  touch /var/lib/mysql/.initialized
fi

pkill mysqld
wait $!

exec mysqld --user=mysql