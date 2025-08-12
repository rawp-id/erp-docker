#!/bin/sh
set -e

# Tunggu MySQL siap
echo "Waiting for MySQL..."
until nc -z -v -w30 mysql 3306
do
  echo "Waiting for database connection..."
  sleep 5
done

# Jalankan migrate
php artisan migrate --force

# Jalankan server
exec "$@"
