FROM php:8.2-apache

# ติดตั้งส่วนเสริมที่จำเป็น
RUN docker-php-ext-install mysqli pdo_mysql

# คัดลอกไฟล์โปรเจกต์
COPY . /var/www/html/

# ใช้คำสั่งเบื้องต้นเพื่อให้ Apache รองรับพอร์ต 8080 อย่างถูกต้อง
RUN sed -i 's/80/8080/g' /etc/apache2/ports.conf /etc/apache2/sites-available/000-default.conf

EXPOSE 8080
