FROM php:8.2-fpm

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
    sqlite3

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install PHP extensions
RUN docker-php-ext-install pdo_mysql pdo_sqlite mbstring exif pcntl bcmath gd

# Get latest Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Set working directory
WORKDIR /var/www

# Copy existing application directory contents
COPY . /var/www

# Install dependencies
RUN composer install --no-dev --optimize-autoloader

# Install Node.js
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
RUN apt-get install -y nodejs

# Install pnpm
RUN npm install -g pnpm

# Install pnpm dependencies
RUN pnpm install --frozen-lockfile

# Set NODE_ENV to production
ENV NODE_ENV=production

# Copy .env.example to .env
RUN cp .env.example .env

# Update APP_URL in .env
RUN sed -i 's#APP_URL=http://localhost#APP_URL=https://storehub-6f2p.onrender.com#' .env

# Generate application key and update .env
RUN php artisan key:generate

# Create SQLite database
RUN touch database/database.sqlite
RUN chown -R www-data:www-data database
RUN chmod -R 775 database

# Run database migrations
RUN php artisan migrate --force

# Clear and cache config
RUN php artisan config:clear
RUN php artisan config:cache

# Build assets
RUN pnpm run build

# Set permissions
RUN chown -R www-data:www-data /var/www
RUN chmod -R 755 /var/www/storage

# Expose port 8000
EXPOSE 8000

# Start php-fpm server
CMD php artisan serve --host=0.0.0.0 --port=8000
