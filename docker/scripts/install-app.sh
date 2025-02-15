#!/bin/bash

composer install --no-interaction --no-plugins --no-scripts --prefer-dist
chown -R www-data:www-data /var/www/storage /var/www/bootstrap/cache
chmod 777 -R /var/www/storage

php artisan migrate
php artisan db:seed
php artisan key:generate

php-fpm
