# --- Stage 1: Build Vue Assets ---
FROM node:20-alpine AS frontend
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

# --- Stage 2: PHP & Application Setup ---
FROM php:8.4-fpm-alpine

# Dependencies များ တပ်ဆင်ခြင်း
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

# Composer ထည့်သွင်းခြင်း
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/html

# Source Code နှင့် Vue Build Assets များကို Copy ကူးခြင်း
COPY . .
COPY --from=frontend /app/public/build ./public/build

# Folder ဆောက်ခြင်း နှင့် Permissions ပေးခြင်း
RUN mkdir -p storage/framework/cache/data \
    storage/framework/sessions \
    storage/framework/views \
    storage/logs \
    bootstrap/cache \
    /var/log/supervisor \
    /var/run/supervisor \
    && chmod -R 777 storage bootstrap/cache /var/log/supervisor /var/run/supervisor

# PHP Dependencies တပ်ဆင်ခြင်း
RUN composer install --no-dev --optimize-autoloader --ignore-platform-reqs --no-scripts

# Project ထဲမှ supervisord.conf ကို Container ထဲသို့ Copy ကူးပေးခြင်း
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
# Project ထဲမှ supervisord.conf ကို Container ထဲသို့ Copy ကူးပေးခြင်း
COPY supervisord.conf /etc/supervisord.conf
COPY . .
# Nginx Configuration ကို Container ထဲသို့ Copy ကူးပေးခြင်း
COPY --from=frontend /app/public/build ./public/build

# Dummy Env Keys များပေး၍ Artisan Caches များ ဆောက်ခြင်း
ENV BROADCAST_DRIVER=log
ENV PUSHER_APP_KEY=dummy
ENV PUSHER_APP_SECRET=dummy
ENV PUSHER_APP_ID=dummy

RUN php artisan package:discover --ansi \
    && php artisan config:clear \
    && php artisan route:clear

# Entrypoint Script ကို ပိုင်ဆိုင်ခွင့်ပေးခြင်း
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

EXPOSE 80

ENTRYPOINT ["docker-entrypoint.sh"]