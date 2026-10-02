FROM php:8.2-apache

# ติดตั้งส่วนเสริมฐานข้อมูลที่จำเป็น
RUN docker-php-ext-install mysqli pdo_mysql

# คัดลอกไฟล์ทั้งหมดเข้าเว็บเซิร์ฟเวอร์
COPY . /var/www/html/

# ปล่อยให้ Apache ใช้ค่าเริ่มต้นทั้งหมด ไม่ต้องไปใช้คำสั่ง sed แก้ไฟล์ config เพื่อป้องกัน MPM พัง
# และกำหนดให้ Railway ส่งพอร์ตผ่านตัวแปร PORT อัตโนมัติ
