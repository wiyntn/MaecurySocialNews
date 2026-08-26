#!/bin/sh

# Route crash မဖြစ်အောင် cache အစား clear ပဲ အရင်လုပ်ပါ
php artisan config:clear
php artisan route:clear
php artisan optimize:clear
php artisan view:clear
php artisan cache:clear
# Database migration (Database ချိတ်ဆက်ပြီးမှ အလုပ်လုပ်မည်)
php artisan migrate --force

# Supervisord စတင်ခြင်း
exec supervisord -c /etc/supervisord.conf