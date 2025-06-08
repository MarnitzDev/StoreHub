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
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd

# Get latest Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Set working directory
WORKDIR /var/www

# Copy existing application directory contents
COPY . /var/www

# Install dependencies
RUN composer install

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

# Generate application key
RUN php artisan key:generate --show --no-ansi > /tmp/app_key.txt

# Expose port 8000
EXPOSE 8000

# Start php-fpm server
CMD APP_KEY=$(cat /tmp/app_key.txt) php artisan serve --host=0.0.0.0 --port=8000
