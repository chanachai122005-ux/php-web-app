FROM php:8.2-apache

# ติดตั้งส่วนเสริมฐานข้อมูล
RUN docker-php-ext-install mysqli pdo_mysql

# คัดลอกไฟล์ default.conf ของเราเข้าไปแทนที่
COPY default.conf /etc/apache2/sites-available/000-default.conf

# สั่งเปลี่ยนพอร์ตในไฟล์ ports.conf ของ Apache ให้เป็น 8080 ด้วย
RUN echo "Listen 8080" > /etc/apache2/ports.conf

# คัดลอกไฟล์โปรเจกต์ทั้งหมด
COPY . /var/www/html/

EXPOSE 8080
