FROM php:8.2-apache

# ติดตั้งส่วนเสริมฐานข้อมูล
RUN docker-php-ext-install mysqli pdo_mysql

# คัดลอกไฟล์โปรเจกต์ทั้งหมดเข้าเว็บเซิร์ฟเวอร์
COPY . /var/www/html/

# สั่งเปลี่ยนพอร์ต 80 เป็น 8080 ในคอนฟิกหลักของ Apache แบบตรงตัว
RUN sed -i 's/:80/:8080/g' /etc/apache2/sites-available/000-default.conf
RUN sed -i 's/80/8080/g' /etc/apache2/ports.conf

EXPOSE 8080
