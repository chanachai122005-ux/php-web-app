FROM php:8.2-apache

RUN docker-php-ext-install mysqli pdo_mysql
RUN a2dismod mpm_event && a2enmod mpm_prefork

# กำหนดให้ Apache ฟังพอร์ต 8080 (เพราะ Railway บังคับใช้พอร์ตนี้)
RUN sed -i 's/80/8080/g' /etc/apache2/ports.conf /etc/apache2/sites-available/000-default.conf

COPY . /var/www/html/
EXPOSE 8080
