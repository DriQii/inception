#!/bin/bash
set -e

mysqld_safe --datadir=/var/lib/mysql &
while ! mysqladmin ping --silent; do
    sleep 1
done

DB_EXISTS=$(mysql -u root -p"supersecret" -s -N -e "SELECT SCHEMA_NAME FROM INFORMATION_SCHEMA.SCHEMATA WHERE SCHEMA_NAME='wp_db';")

if [ -z "$DB_EXISTS" ]; then
	# Première initialisation : le répertoire de données est vide

    # Démarrer MariaDB en arrière-plan pour l'initialisation
    mysqld_safe --datadir=/var/lib/mysql &

    # Attendre que MariaDB soit prêt
    while ! mysqladmin ping --silent; do
        sleep 1
    done

    # Exécuter les commandes d'initialisation
    mysql -u root -p"supersecret" <<EOF
GRANT ALL PRIVILEGES ON wp_db.* TO 'wp'@'%' IDENTIFIED BY 'wp123';
FLUSH PRIVILEGES;
CREATE DATABASE wp_db;
EOF

    # Arrêter l'instance temporaire
    mysqladmin -u root -p"supersecret" shutdown
	exec mysqld_safe --datadir=/var/lib/mysql
fi

# Lancer MariaDB en mode premier plan (remplace le processus courant)
exec mysqld_safe --datadir=/var/lib/mysql
