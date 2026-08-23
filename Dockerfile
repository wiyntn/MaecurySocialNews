# Stage 1: Vue JS (Vite) Assets
FROM node:20-alpine as frontend
WORKDIR /app

COPY package*.json ./
RUN npm install --legacy-peer-deps

COPY . .

# build.num ရေးနိုင်အောင် storage/frontend folder ဆောက်ပေးခြင်း
RUN mkdir -p storage/frontend

RUN npm run build

# Stage 2: Laravel PHP Environment ပြင်ဆင်ခြင်း
FROM php:8.3-fpm-alpine

# System Dependencies & PHP Extensions တပ်ဆင်ခြင်း
RUN apk add --no-cache nginx supervisor mysql-client libpng-dev libjpeg-turbo-dev freetype-dev libzip-dev zip unzip git
RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd pdo pdo_mysql zip bcmath opcache

# Composer တပ်ဆင်ခြင်း
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/html

# Source Code များ ကူးယူခြင်း
COPY . .
COPY --from=frontend /app/public/build ./public/build

# 1. Permission မရှိသည့် Error ကိုဖြေရှင်းရန် Folder များဆောက်၍ Permission ပေးခြင်း

# 1. မရှိသေးသော Folder များကို ဆောက်ပြီး Permission ပေးခြင်း
RUN mkdir -p storage/framework/cache/data \
    storage/framework/sessions \
    storage/framework/views \
    storage/logs \
    bootstrap/cache \
    && chmod -R 777 storage bootstrap/cache

    # PHP Dependencies တပ်ဆင်ခြင်း
RUN composer install --no-dev --optimize-autoloader --ignore-platform-reqs --no-scripts

# Build time အတွက် ယာယီ Environment Variables များ သတ်မှတ်ခြင်း
ENV BROADCAST_DRIVER=log
ENV PUSHER_APP_KEY=dummy
ENV PUSHER_APP_SECRET=dummy
ENV PUSHER_APP_ID=dummy
ENV REVERB_APP_KEY=dummy
ENV REVERB_APP_SECRET=dummy
ENV REVERB_APP_ID=dummy

# Supervisor အတွက် လိုအပ်သော Log Folder များ ဆောက်ပေးခြင်း
RUN mkdir -p /var/log/supervisor /var/run/supervisor \
    && chmod -R 777 /var/log/supervisor /var/run/supervisor
    
# Auto discover နဲ့ Cache ရှင်းပေးခြင်း
RUN php artisan package:discover --ansi \
    && php artisan config:clear \
    && php artisan route:clear


# Storage & Cache အတွက် Permission ပေးခြင်း
RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache

# Configurations များ ကူးယူခြင်း
COPY docker/nginx/default.conf /etc/nginx/http.d/default.conf
COPY docker/supervisor/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 80

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]