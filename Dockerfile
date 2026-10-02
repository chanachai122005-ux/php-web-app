FROM php:8.2-apache

# ติดตั้งส่วนเสริมฐานข้อมูล
RUN docker-php-ext-install mysqli pdo_mysql

# คัดลอกไฟล์คอนฟิกพอร์ต 8080 ของเราไปแทนที่คอนฟิกเดิม
COPY railway.conf /etc/apache2/sites-available/000-default.conf

# สั่งให้ Apache ฟังพอร์ต 8080 ใน ports.conf โดยตรง
RUN echo "Listen 8080" > /etc/apache2/ports.conf

# คัดลอกไฟล์โปรเจกต์ทั้งหมดเข้าเว็บเซิร์ฟเวอร์
COPY . /var/www/html/

EXPOSE 8080
