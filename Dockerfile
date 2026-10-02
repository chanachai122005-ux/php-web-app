FROM php:8.2-apache

# ติดตั้งส่วนเสริมฐานข้อมูล
RUN docker-php-ext-install mysqli pdo_mysql

# คัดลอกไฟล์โปรเจกต์ทั้งหมด
COPY . /var/www/html/

# กำหนดให้ Apache เปลี่ยนพอร์ตจาก 80 เป็น 8080 อย่างถูกต้อง
RUN sed -i 's/80/8080/g' /etc/apache2/sites-available/000-default.conf /etc/apache2/ports.conf

EXPOSE 8080
