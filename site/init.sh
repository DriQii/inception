#!/bin/bash
set -e
if ! php /usr/local/bin/wp-cli.phar user get evella --allow-root --path=/website --quiet > /dev/null 2>&1; then
php /usr/local/bin/wp-cli.phar core install \
  --url="https://${DOMAIN_NAME}" \
  --title="Inception" \
  --admin_user="${WP_ADMIN_USER}" \
  --admin_password="${WP_ADMIN_PASSWORD}" \
  --admin_email="${WP_ADMIN_EMAIL}" \
  --allow-root

php /usr/local/bin/wp-cli.phar user create "$WP_USER" "$WP_USER_EMAIL" \
  --user_pass="$WP_USER_PASSWORD" \
  --path=/website \
  --allow-root
fi
mkdir -p /run/php
exec /usr/sbin/php-fpm7.4 -F

