FROM php:8.2-apache

# ติดตั้งส่วนเสริมฐานข้อมูล
RUN docker-php-ext-install mysqli pdo_mysql

# คัดลอกไฟล์คอนฟิก Apache ที่เราสร้างขึ้นใหม่ ไปแทนที่ค่าเดิม
COPY default.conf /etc/apache2/sites-available/000-default.conf
RUN echo "Listen 8080" >> /etc/apache2/ports.conf

# คัดลอกไฟล์โปรเจกต์ทั้งหมด
COPY . /var/www/html/

EXPOSE 8080
