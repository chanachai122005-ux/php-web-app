FROM php:8.2-apache

# ติดตั้งส่วนเสริมฐานข้อมูล
RUN docker-php-ext-install mysqli pdo_mysql

# คัดลอกไฟล์โปรเจกต์ทั้งหมดเข้าเว็บเซิร์ฟเวอร์
WORKDIR /var/www/html
COPY . .

# ใช้คำสั่งเปลี่ยนพอร์ตแบบบรรทัดเดียวที่ไม่กระทบโมดูล MPM
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
RUN sed -i 's/80/8080/g' /etc/apache2/ports.conf /etc/apache2/sites-available/000-default.conf

EXPOSE 8080
