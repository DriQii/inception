#!/bin/bash
set -e

mysqld_safe --datadir=/var/lib/mysql &
while ! mysqladmin ping --silent; do
    sleep 1
done

DB_EXISTS=$(mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -s -N -e "SELECT SCHEMA_NAME FROM INFORMATION_SCHEMA.SCHEMATA WHERE SCHEMA_NAME='${MYSQL_DATABASE}';")

if [ -z "$DB_EXISTS" ]; then

	mysql -u root -p"${MYSQL_ROOT_PASSWORD}" <<EOF
CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};
GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
FLUSH PRIVILEGES;
EOF

fi

mysqladmin -u root -p"${MYSQL_ROOT_PASSWORD}" shutdown
exec mysqld_safe --datadir=/var/lib/mysql
