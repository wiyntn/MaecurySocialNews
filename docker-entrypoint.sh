#!/bin/sh

set -e

echo "=========================================="
echo "Starting Mercury Social News"
echo "=========================================="

echo "APP_ENV: ${APP_ENV}"
echo "BROADCAST_CONNECTION: ${BROADCAST_CONNECTION}"
echo "PUSHER_APP_ID: ${PUSHER_APP_ID}"
echo "PUSHER_APP_KEY configured: $([ -n "${PUSHER_APP_KEY}" ] && echo yes || echo no)"
echo "PUSHER_APP_CLUSTER: ${PUSHER_APP_CLUSTER}"

echo "=========================================="
echo "Clearing Laravel cache..."
echo "=========================================="

php artisan config:clear
php artisan route:clear
php artisan view:clear

echo "=========================================="
echo "Caching Laravel configuration..."
echo "=========================================="

php artisan config:cache

echo "=========================================="
echo "Starting services..."
echo "=========================================="

exec supervisord -c /etc/supervisor/conf.d/supervisord.conf