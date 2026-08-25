#!/bin/sh

# Laravel Caches များကို ရှင်းထုတ်ပြီး ပြန်ဆောက်ခြင်း
php artisan config:cache
php artisan route:cache
php artisan view:cache

# Database Migration ခေါ်ရန် (လိုအပ်ပါက)
php artisan migrate --force

# Supervisor/Nginx ကို စတင်ခြင်း
exec supervisord -c /etc/supervisor/conf.d/supervisord.conf