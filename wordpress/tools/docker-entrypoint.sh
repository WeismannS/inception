#!/bin/sh

wp-cli.phar cli update --yes --allow-root
echo "[WP config] Downloading WordPress..."
wp-cli.phar core download --allow-root
echo "[WP config] Creating wp-config.php..."
wp-cli.phar config create --dbname=wordpress --dbuser=${MYSQL_USER} --dbpass=${MYSQL_PASSWORD} --dbhost=mariadb --path=/var/www/inception/htdocs/wordpress --allow-root
echo "[WP config] Installing WordPress core..."
wp-cli.phar core install --url="localhost" --title=incpetion --admin_user=${WP_ADMIN_USER} --admin_password=${WP_ADMIN_PASS} --admin_email=admin@gmail.com --path=/var/www/inception/htdocs/wordpress --allow-root
echo "[WP config] Creating WordPress default user..."

echo "[Redis setup] Installing and activating Redis plugin..."
wp-cli.phar plugin install redis-cache --activate --allow-root --path=/var/www/inception/htdocs/wordpress
echo "[Redis setup] Configuring Redis to connect to the Redis container..."
wp-cli.phar config set WP_REDIS_HOST redis --allow-root --path=/var/www/inception/htdocs/wordpress
echo "[Redis setup] Enabling Redis object cache..."
wp-cli.phar redis enable --allow-root --path=/var/www/inception/htdocs/wordpress
exec php-fpm8 -F