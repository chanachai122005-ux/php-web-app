FROM php:8.2-apache

# ติดตั้งส่วนเสริมฐานข้อมูล
RUN docker-php-ext-install mysqli pdo_mysql

# คัดลอกไฟล์โปรเจกต์
COPY . /var/www/html/

# แก้ไขพอร์ต Apache จาก 80 เป็น 8080 ให้ถูกต้องทั้งสองไฟล์
RUN sed -i 's/Listen 80/Listen 8080/g' /etc/apache2/ports.conf && \
    sed -i 's///g' /etc/apache2/sites-available/000-default.conf

EXPOSE 8080
