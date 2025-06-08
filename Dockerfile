FROM php:8.2-fpm

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install PHP extensions
RUN docker-php-ext-install mbstring exif pcntl bcmath gd

# Get latest Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Set working directory
WORKDIR /var/www

# Copy existing application directory contents
COPY . /var/www

# Set permissions for Composer
RUN chown -R www-data:www-data /var/www

# Switch to www-data user
USER www-data

# Install dependencies
RUN composer install --no-dev --no-scripts --optimize-autoloader

# Switch back to root
USER root

# Install Node.js
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
RUN apt-get install -y nodejs

# Install pnpm
RUN npm install -g pnpm

# Install pnpm dependencies
RUN pnpm install --frozen-lockfile

# Set NODE_ENV to production
ENV NODE_ENV=production

# Build assets
RUN pnpm run build

# Copy .env.example to .env
RUN cp .env.example .env

# Generate application key and update .env
RUN php artisan key:generate

# Run post-install scripts
RUN php artisan package:discover --ansi

# Clear and cache config
RUN php artisan config:clear
RUN php artisan config:cache
RUN php artisan route:cache
RUN php artisan view:cache

# Set permissions
RUN chown -R www-data:www-data /var/www
RUN chmod -R 755 /var/www/storage

# Expose port 8000
EXPOSE 8000

# Start php-fpm server
CMD php artisan serve --host=0.0.0.0 --port=8000
