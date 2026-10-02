FROM php:8.2-apache

# ติดตั้งส่วนเสริมฐานข้อมูลที่จำเป็น
RUN docker-php-ext-install mysqli pdo_mysql

# คัดลอกไฟล์โปรเจกต์ทั้งหมด
COPY . /var/www/html/

# สั่งให้ Apache ปรับพอร์ตมารับค่าจากตัวแปร PORT ที่ Railway กำหนดให้อัตโนมัติ
RUN sed -i 's/80/${PORT}/g' /etc/apache2/sites-available/000-default.conf /etc/apache2/ports.conf

EXPOSE 8080
