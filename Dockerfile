FROM php:8.2-apache

# ติดตั้งส่วนเสริมฐานข้อมูล
RUN docker-php-ext-install mysqli pdo_mysql

# คัดลอกไฟล์โปรเจกต์
COPY . /var/www/html/

# ปรับให้ Apache ใช้พอร์ตตามตัวแปร $PORT ที่ Railway กำหนดให้แบบอัตโนมัติ
RUN sed -i 's/80/${PORT}/g' /etc/apache2/sites-available/000-default.conf /etc/apache2/ports.conf

EXPOSE 80
