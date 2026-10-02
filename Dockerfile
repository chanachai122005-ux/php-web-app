FROM php:8.2-apache

# ติดตั้งส่วนเสริมฐานข้อมูล
RUN docker-php-ext-install mysqli pdo_mysql

# คัดลอกไฟล์โปรเจกต์ทั้งหมดเข้าเว็บเซิร์ฟเวอร์
WORKDIR /var/www/html
COPY . .

# ให้ Apache รันตามพอร์ตที่ Railway กำหนดผ่านตัวแปร PORT อัตโนมัติ
ENV PORT=8080
RUN sed -i "s/80/\${PORT}/g" /etc/apache2/sites-available/000-default.conf /etc/apache2/ports.conf

EXPOSE 8080
