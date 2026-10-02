FROM php:8.2-apache

# ติดตั้งส่วนเสริมฐานข้อมูล
RUN docker-php-ext-install mysqli pdo_mysql

# คัดลอกไฟล์โปรเจกต์ทั้งหมด
COPY . /var/www/html/

# บังคับแก้พอร์ต 80 เป็น 8080 ทั้งในคอนฟิกหลักและไฟล์พอร์ตของ Apache โดยตรง
RUN sed -i 's/:80/:8080/g' /etc/apache2/sites-available/000-default.conf
RUN sed -i 's/80/8080/g' /etc/apache2/ports.conf

EXPOSE 8080
