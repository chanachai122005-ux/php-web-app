FROM php:8.2-apache

# ติดตั้งส่วนเสริม mysqli และ pdo_mysql
RUN docker-php-ext-install mysqli pdo_mysql

# ตั้งค่าพอร์ต 8080 ลงในไฟล์ ports.conf ของ Apache โดยตรง
RUN echo "Listen 8080" > /etc/apache2/ports.conf

# ตั้งค่า VirtualHost ให้ใช้พอร์ต 8080 และเปิดใช้งาน prefork MPM
RUN sed -i 's/:80/:8080/g' /etc/apache2/sites-available/000-default.conf
RUN a2dismod mpm_event && a2enmod mpm_prefork

COPY . /var/www/html/

EXPOSE 8080
