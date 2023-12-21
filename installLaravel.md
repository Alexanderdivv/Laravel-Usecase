## 1. installing Laravel on Ubuntu

use the installationLaravel.bash file

continue to

## Configure Apache to server Laravel site

sudo nano /etc/apache2/sites-available/laravel.conf

<VirtualHost \*:80>
ServerName 52.74.39.222
ServerAdmin admin@52.74.39.222
DocumentRoot /var/www/html/laravelapp/public
<Directory /var/www/html/laravelapp>
AllowOverride All
</Directory>
ErrorLog ${APACHE_LOG_DIR}/error.log
CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>

`sudo a2ensite laravel.conf`

`sudo a2enmod rewrite`

`sudo systemctl restart apache2`
