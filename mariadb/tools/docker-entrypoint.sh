#!/bin/sh
set -e

mysqld --user=mysql &

until mysql -e "SELECT 1"; do
  echo "MySQL is starting up..."
  sleep 1
done

if [ ! -f /var/lib/mysql/.initialized ]; then
  echo "Initializing database..."
  mysql < /docker-entrypoint-initdb.d/init.sql
  touch /var/lib/mysql/.initialized
fi

pkill mysqld
wait $!

exec mysqld --user=mysql