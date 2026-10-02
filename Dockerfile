FROM php:8.2-apache

# ติดตั้งส่วนเสริมฐานข้อมูล
RUN docker-php-ext-install mysqli pdo_mysql

# คัดลอกไฟล์คอนฟิกตัวเก่งของเราไปทับค่าเริ่มต้นของ Apache
COPY default.conf /etc/apache2/sites-available/000-default.conf

# คัดลอกไฟล์โปรเจกต์ทั้งหมด
COPY . /var/www/html/

EXPOSE 8080
