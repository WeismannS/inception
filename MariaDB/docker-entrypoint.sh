#!/bin/sh
set -e

# Start MySQL in background
mysqld --user=mysql &

# Wait for MySQL to start
until mysql -e "SELECT 1"; do
  echo "MySQL is starting up..."
  sleep 1
done

# Run initialization script if database hasn't been initialized yet
if [ ! -f /var/lib/mysql/.initialized ]; then
  echo "Initializing database..."
  mysql < /docker-entrypoint-initdb.d/init.sql
  touch /var/lib/mysql/.initialized
fi

# Stop background MySQL
pkill mysqld
wait $!

# Start MySQL in foreground
exec mysqld --user=mysql