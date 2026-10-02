FROM php:8.2-apache

RUN docker-php-ext-install mysqli pdo_mysql

# คัดลอกไฟล์ทั้งหมดไปที่ /var/www/html/
COPY . /var/www/html/

# สั่งเปลี่ยนพอร์ตในคอนฟิกของ Apache เป็น 8080 ให้ครบทุกจุด
RUN sed -i 's/80/8080/g' /etc/apache2/sites-available/000-default.conf /etc/apache2/ports.conf

# กำหนดตัวแปรพอร์ตให้ Apache รันบน 8080
ENV APACHE_PORT=8080

EXPOSE 8080
