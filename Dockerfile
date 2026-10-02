FROM php:8.2-apache

# ติดตั้งส่วนเสริมฐานข้อมูล
RUN docker-php-ext-install mysqli pdo_mysql

# คัดลอกไฟล์โปรเจกต์
COPY . /var/www/html/

# บังคับเปลี่ยนพอร์ต Apache จาก 80 ให้ตรงกับตัวแปร $PORT ของ Railway แบบไดนามิก
RUN sed -i 's/Listen 80/Listen ${PORT}/g' /etc/apache2/ports.conf && \
    sed -i 's///g' /etc/apache2/sites-available/000-default.conf

EXPOSE 80
