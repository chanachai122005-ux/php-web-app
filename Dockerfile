FROM php:8.2-apache

# ติดตั้งส่วนเสริมฐานข้อมูลที่จำเป็น
RUN docker-php-ext-install mysqli pdo_mysql

# คัดลอกไฟล์โปรเจกต์ทั้งหมดเข้า Document Root
COPY . /var/www/html/

# เปิดใช้งานพอร์ต 8080 สำหรับ Railway
EXPOSE 8080
