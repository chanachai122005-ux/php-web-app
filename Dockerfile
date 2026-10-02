FROM php:8.2-apache

RUN docker-php-ext-install mysqli pdo_mysql

# กำหนดให้ Apache ฟังพอร์ต 8080 ผ่านตัวแปร Environment ของ Apache โดยตรง
ENV APACHE_RUN_PORT=8080
RUN sed -i "s/80/8080/g" /etc/apache2/sites-available/000-default.conf /etc/apache2/ports.conf

COPY . /var/www/html/
EXPOSE 8080
