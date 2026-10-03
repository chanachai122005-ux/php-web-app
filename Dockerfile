FROM php:8.2-apache
RUN docker-php-ext-install pdo pdo_mysql mysqli
COPY . /var/www/html/
CMD ["sh", "-c", "rm -f /etc/apache2/mods-enabled/mpm_*; ln -sf /etc/apache2/mods-available/mpm_prefork.load /etc/apache2/mods-enabled/mpm_prefork.load; ln -sf /etc/apache2/mods-available/mpm_prefork.conf /etc/apache2/mods-enabled/mpm_prefork.conf; sed -i \"s/Listen 80/Listen ${PORT:-80}/\" /etc/apache2/ports.conf; sed -i \"s/:80>/:${PORT:-80}>/\" /etc/apache2/sites-available/000-default.conf; apache2-foreground"]
