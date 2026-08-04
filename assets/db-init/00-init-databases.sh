#!/bin/bash
set -e

mysql -u root -p"$MYSQL_ROOT_PASSWORD" <<-EOSQL
	CREATE DATABASE IF NOT EXISTS \`ssa_main_backend\`;
	CREATE DATABASE IF NOT EXISTS \`ssa_content_service\`;
EOSQL

mysql -u root -p"$MYSQL_ROOT_PASSWORD" "ssa_main_backend" < /dumps/ssa_main_backend.sql
mysql -u root -p"$MYSQL_ROOT_PASSWORD" "ssa_content_service" < /dumps/ssa_content_service.sql
