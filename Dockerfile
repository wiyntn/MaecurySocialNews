# --- Stage 1: Build Vue Assets ---
FROM node:20-alpine AS frontend
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

# --- Stage 2: PHP & Application Setup ---
FROM php:8.4-fpm-alpine

RUN apk add --no-cache \
    nginx \
    supervisor \
    curl \
    libpng-dev \
    libjpeg-turbo-dev \
    freetype-dev \
    libzip-dev \
    zip \
    unzip \
    git \
    oniguruma-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install pdo pdo_mysql mbstring gd zip bcmath opcache

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/html

# Source Code နှင့် Vue Assets များ ကူးယူခြင်း
COPY . .
COPY --from=frontend /app/public/build ./public/build

# Config Files များကို လမ်းကြောင်းအမှန်သို့ Copy ကူးခြင်း (အဓိကကျပါသည်)
COPY supervisord.conf /etc/supervisord.conf
COPY nginx.conf /etc/nginx/http.d/default.conf

# Directory permissions
RUN mkdir -p storage/framework/cache/data \
    storage/framework/sessions \
    storage/framework/views \
    storage/logs \
    bootstrap/cache \
    /var/log/supervisor \
    /var/run/supervisor \
    && chmod -R 777 storage bootstrap/cache /var/log/supervisor /var/run/supervisor

RUN composer install --no-dev --optimize-autoloader --ignore-platform-reqs --no-scripts

ENV BROADCAST_DRIVER=log
ENV PUSHER_APP_KEY=dummy
ENV PUSHER_APP_SECRET=dummy
ENV PUSHER_APP_ID=dummy

RUN php artisan package:discover --ansi \
    && php artisan config:clear \
    && php artisan route:clear 
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

EXPOSE 80

ENTRYPOINT ["docker-entrypoint.sh"]