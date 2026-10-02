FROM php:8.2-apache

# ติดตั้งส่วนเสริม mysqli และ pdo_mysql
RUN docker-php-ext-install mysqli pdo_mysql

# คัดลอกไฟล์โปรเจกต์ทั้งหมดไปยังโฟลเดอร์เว็บของ Apache
COPY . /var/www/html/

# ใช้คำสั่งเปลี่ยนพอร์ตเริ่มต้นของ Apache 80 เป็น 8080 ในไฟล์หลักทีเดียวจบ
RUN sed -i 's/80/8080/g' /etc/apache2/sites-available/000-default.conf /etc/apache2/ports.conf

EXPOSE 8080
