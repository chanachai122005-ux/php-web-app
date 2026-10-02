FROM php:8.2-apache

# ติดตั้งส่วนเสริม mysqli และ pdo_mysql
RUN docker-php-ext-install mysqli pdo_mysql

# คัดลอกไฟล์โปรเจกต์
COPY . /var/www/html/

# สั่งให้ Apache เปลี่ยนมาฟังที่พอร์ต 8080 ทั้งในไฟล์ ports.conf และ sites-available
RUN sed -i 's/:80/:8080/g' /etc/apache2/ports.conf /etc/apache2/sites-available/000-default.conf

EXPOSE 8080
