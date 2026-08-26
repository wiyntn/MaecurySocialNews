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

# Nginx Configuration ကို Dockerfile ထဲတွင် တိုက်ရိုက် ဖန်တီးခြင်း (404 Error Fix)
RUN echo 'server { \
    listen 80; \
    server_name _; \
    root /var/www/html/public; \
    index index.php index.html; \
    charset utf-8; \
    location / { \
        try_files $uri $uri/ /index.php?$query_string; \
    } \
    location = /favicon.ico { access_log off; log_not_found off; } \
    location = /robots.txt  { access_log off; log_not_found off; } \
    error_page 404 /index.php; \
    location ~ \.php$ { \
        fastcgi_pass 127.0.0.1:9000; \
        fastcgi_param SCRIPT_FILENAME $realpath_root$fastcgi_script_name; \
        include fastcgi_params; \
    } \
    location ~ /\.(?!well-known).* { \
        deny all; \
    } \
}' > /etc/nginx/http.d/default.conf

# Folder ဆောက်ခြင်း နှင့် Permissions ပေးခြင်း
RUN mkdir -p storage/framework/cache/data \
    storage/framework/sessions \
    storage/framework/views \
    storage/logs \
    bootstrap/cache \
    /var/log/supervisor \
    /var/run/supervisor \
    && chown -R www-data:www-data storage bootstrap/cache \
    && chmod -R 775 storage bootstrap/cache \
    && chmod -R 777 /var/log/supervisor /var/run/supervisor

# PHP Dependencies တပ်ဆင်ခြင်း (--ignore-platform-reqs ထည့်သွင်းပြီး PHP 8.4 Version Error Fix)
RUN composer install --ignore-platform-reqs --no-dev --optimize-autoloader --no-interaction --no-scripts

# Project ထဲမှ supervisord.conf ကို Container ထဲသို့ Copy ကူးပေးခြင်း
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

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