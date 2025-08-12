FROM php:8.3.24-fpm-alpine

# Install dependencies & PHP extensions
RUN apk add --no-cache \
    git curl unzip libpng-dev oniguruma-dev libxml2-dev libzip-dev \
    && docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd zip

# Install FrankenPHP
RUN curl -fsSL https://frankenphp.dev/install.sh | sh && mv frankenphp /usr/local/bin/

WORKDIR /var/www/html

# Clone Laravel project
RUN git clone --branch main https://github.com/rawp-id/mps.git .

# Fix git ownership issue
RUN git config --global --add safe.directory /var/www/html

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install Laravel dependencies
RUN composer install --no-dev --optimize-autoloader

# Setup Laravel environment
RUN cp .env.example .env \
    && php artisan key:generate \
    && chmod -R 777 storage bootstrap/cache

EXPOSE 8000

# Start FrankenPHP with Laravel Octane
CMD ["php", "artisan", "octane:start", "--host=0.0.0.0"]

