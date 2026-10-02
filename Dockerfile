FROM php:8.2-apache

# ติดตั้งส่วนเสริม mysqli และ pdo_mysql
RUN docker-php-ext-install mysqli pdo_mysql

# เปลี่ยนค่าเริ่มต้นพอร์ตของ Apache ในไฟล์ configuration ทั้งหมดให้เป็น 8080
RUN sed -i 's/:80/:8080/g' /etc/apache2/sites-available/000-default.conf /etc/apache2/ports.conf

# เปิดใช้งาน mpm_prefork เพื่อป้องกัน Error เรื่องโมดูลซ้ำซ้อน
RUN a2dismod mpm_event && a2enmod mpm_prefork

COPY . /var/www/html/

EXPOSE 8080
