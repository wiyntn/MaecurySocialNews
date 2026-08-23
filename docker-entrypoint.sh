#!/bin/sh


# Config / Route Caching ပြုလုပ်ခြင်း
php artisan config:cache
php artisan route:cache
php artisan view:cache

# Nginx နှင့် PHP-FPM / Supervisor ကို စတင်ခြင်း
exec supervisord -c /etc/supervisor/conf.d/supervisord.conf