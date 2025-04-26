#!/bin/sh
set -e

mysqld --user=mysql &

until mysql -e "SELECT 1"; do
  echo "MySQL is starting up..."
  sleep 1
done

if [ ! -f /var/lib/mysql/.initialized ]; then
  echo "Initializing database..."
  sed -i "s/REDACTED_PASS/${MYSQL_PASSWORD}/g" /docker-entrypoint-initdb.d/init.sql
  sed -i "s/REDACTED_USER/${MYSQL_USER}/g" /docker-entrypoint-initdb.d/init.sql
  echo "Database credentials have been configured."
  mysql < /docker-entrypoint-initdb.d/init.sql
  touch /var/lib/mysql/.initialized
fi

pkill mysqld
wait $!

exec mysqld --user=mysql