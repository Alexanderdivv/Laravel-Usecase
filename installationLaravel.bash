#!/bin/bash

# update repo ubuntu
sudo apt-get update -y

# install apache2
sudo apt install apache2 -y
sudo systemctl start apache2
sudo systemctl enable apache2

sudo apt-get install php-curl -y
sudo apt install php libapache2-mod-php php-mbstring php-cli php-bcmath php-json php-xml php-zip php-pdo php-common php-tokenizer php-mysql -y

# install mariadb-server
sudo apt install mariadb-server -y

sudo mysql -u root -p

# create database
CREATE DATABASE laravel_db;
CREATE USER 'laravel_user'@'localhost' IDENTIFIED BY 'secretpassword';
GRANT ALL ON laravel_db.* TO 'laravel_user'@'localhost';
FLUSH PRIVILEGES;
QUIT;


curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
sudo chmod +x /usr/local/bin/composer
cd /var/www/html
sudo composer create-project laravel/laravel laravelapp

sudo chown -R www-data:www-data /var/www/html/laravelapp
sudo chmod -R 775 /var/www/html/laravelapp/storage

cd laravelapp
php artisan