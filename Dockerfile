FROM php:8.2-apache

# ติดตั้งส่วนเสริมฐานข้อมูล และเปิดใช้งาน mod_rewrite
RUN docker-php-ext-install mysqli pdo_mysql \
    && a2enmod rewrite

# คัดลอกไฟล์โปรเจกต์
COPY . /var/www/html/

# ปรับปรุงสิทธิ์การใช้งานไฟล์ให้ www-data
RUN chown -R www-data:www-data /var/www/html

EXPOSE 80
