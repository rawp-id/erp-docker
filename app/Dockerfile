FROM php:8.3-fpm-bookworm

# Ensure apt uses HTTPS and update CA certificates
RUN sed -i 's|http://deb.debian.org|https://deb.debian.org|g' /etc/apt/sources.list && \
    apt-get update && apt-get install -y apt-transport-https ca-certificates && \
    apt-get update && apt-get upgrade -y && apt-get install -y \
    unzip git curl libpng-dev libonig-dev libxml2-dev libzip-dev zip \
    && docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd zip \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

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

