FROM php:8.2-apache

RUN docker-php-ext-install mysqli pdo_mysql

COPY . /var/www/html/

# สร้างไฟล์คอนฟิกพอร์ต 8080 ขึ้นมาใหม่ทับไปเลย ง่ายและไม่พังแน่
RUN echo "Listen 8080" > /etc/apache2/ports.conf
RUN echo "<VirtualHost *:8080>" > /etc/apache2/sites-available/000-default.conf \
    && echo "    DocumentRoot /var/www/html" >> /etc/apache2/sites-available/000-default.conf \
    && echo "</VirtualHost>" >> /etc/apache2/sites-available/000-default.conf

EXPOSE 8080
