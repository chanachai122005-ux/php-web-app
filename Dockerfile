FROM php:8.2-apache

# ติดตั้งส่วนเสริมฐานข้อมูล
RUN docker-php-ext-install mysqli pdo_mysql

# เปลี่ยนพอร์ต Apache ให้เป็น 8080 ให้ตรงกับ Railway
RUN sed -i 's/80/8080/g' /etc/apache2/ports.conf /etc/apache2/sites-available/000-default.conf

# คัดลอกไฟล์โปรเจกต์
COPY . /var/www/html/

EXPOSE 8080
