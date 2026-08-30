# ============================================================
# Stage 1: Build Frontend Assets
# ============================================================
FROM node:20-alpine AS frontend

WORKDIR /app

# Install Node dependencies
COPY package*.json ./
RUN npm ci

# Copy application source
COPY . .

# ------------------------------------------------------------
# Vite build-time variables
# These MUST be available before "npm run build"
# ------------------------------------------------------------
ARG VITE_PUSHER_APP_KEY
ARG VITE_PUSHER_APP_CLUSTER
ARG VITE_PUSHER_DEBUG_CONSOLE=false

ENV VITE_PUSHER_APP_KEY=${VITE_PUSHER_APP_KEY}
ENV VITE_PUSHER_APP_CLUSTER=${VITE_PUSHER_APP_CLUSTER}
ENV VITE_PUSHER_DEBUG_CONSOLE=${VITE_PUSHER_DEBUG_CONSOLE}

# Debug build values
RUN echo "=========================================="
RUN echo "Building frontend..."
RUN echo "Pusher Cluster: ${VITE_PUSHER_APP_CLUSTER}"
RUN echo "Pusher Key is set: $([ -n "${VITE_PUSHER_APP_KEY}" ] && echo yes || echo no)"
RUN echo "=========================================="

# Build Vue/Vite assets
RUN npm run build


# ============================================================
# Stage 2: PHP / Laravel Application
# ============================================================
FROM php:8.4-fpm-alpine

# ------------------------------------------------------------
# System dependencies
# ------------------------------------------------------------
RUN apk add --no-cache \
    nginx \
    supervisor \
    curl \
    libpng-dev \
    libjpeg-turbo-dev \
    freetype-dev \
    libwebp-dev \
    libzip-dev \
    icu-dev \
    zip \
    unzip \
    git \
    oniguruma-dev

# ------------------------------------------------------------
# PHP extensions
# ------------------------------------------------------------
RUN docker-php-ext-configure gd \
        --with-freetype \
        --with-jpeg \
        --with-webp \
    && docker-php-ext-install \
        pdo \
        pdo_mysql \
        mbstring \
        gd \
        zip \
        bcmath \
        opcache \
        intl \
        exif


# ============================================================
# Composer
# ============================================================
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer


# ============================================================
# Application
# ============================================================
WORKDIR /var/www/html

COPY . .

# Copy already-built frontend assets
COPY --from=frontend /app/public/build ./public/build


# ============================================================
# Nginx configuration
# ============================================================
RUN echo 'server { \
    listen 80; \
    server_name _; \
    root /var/www/html/public; \
    index index.php index.html; \
    charset utf-8; \
\
    client_max_body_size 100M; \
\
    proxy_set_header Host $host; \
    proxy_set_header X-Real-IP $remote_addr; \
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for; \
    proxy_set_header X-Forwarded-Proto $scheme; \
\
    location / { \
        try_files $uri $uri/ /index.php?$query_string; \
    } \
\
    location = /favicon.ico { \
        access_log off; \
        log_not_found off; \
    } \
\
    location = /robots.txt { \
        access_log off; \
        log_not_found off; \
    } \
\
    error_page 404 /index.php; \
\
    location ~ \.php$ { \
        try_files $uri =404; \
        fastcgi_pass 127.0.0.1:9000; \
        fastcgi_param SCRIPT_FILENAME $realpath_root$fastcgi_script_name; \
        fastcgi_param HTTP_X_FORWARDED_PROTO https; \
        fastcgi_param HTTPS on; \
        include fastcgi_params; \
    } \
\
    location ~ /\.(?!well-known).* { \
        deny all; \
    } \
}' > /etc/nginx/http.d/default.conf


# ============================================================
# Laravel directories / permissions
# ============================================================
RUN mkdir -p \
    storage/framework/cache/data \
    storage/framework/sessions \
    storage/framework/views \
    storage/logs \
    storage/app/public \
    storage/frontend \
    bootstrap/cache \
    /var/log/supervisor \
    /var/run/supervisor \
\
    && echo "1" > storage/frontend/build.num \
\
    && chown -R www-data:www-data \
        storage \
        bootstrap/cache \
\
    && chmod -R 775 \
        storage \
        bootstrap/cache \
\
    && chmod -R 777 \
        /var/log/supervisor \
        /var/run/supervisor


# ============================================================
# Composer dependencies
# ============================================================
RUN composer install \
    --ignore-platform-reqs \
    --no-dev \
    --optimize-autoloader \
    --no-interaction \
    --no-scripts


# ============================================================
# Supervisor
# ============================================================
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf


# ============================================================
# Laravel runtime defaults
# ============================================================
ENV APP_ENV=production
ENV BROADCAST_CONNECTION=pusher

ENV PUSHER_APP_CLUSTER=ap1
ENV PUSHER_HOST=api-ap1.pusher.com
ENV PUSHER_PORT=443
ENV PUSHER_SCHEME=https


# ============================================================
# Remove old Laravel config cache
# ============================================================
RUN rm -f bootstrap/cache/config.php


# ============================================================
# Entrypoint
# ============================================================
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

RUN chmod +x /usr/local/bin/docker-entrypoint.sh


# ============================================================
# Port
# ============================================================
EXPOSE 80


# ============================================================
# Start
# ============================================================
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]