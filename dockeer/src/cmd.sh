apt-get -y update
apt-get -y upgrade
apt-get -y install nginx
apt-get -y install gnupg
apt-get -y install wget
apt-get -y install default-mysql-server
apt-get -y install php php-common
apt-get -y install php-cli php-fpm php-json php-pdo php-mysql php-zip php-gd  php-mbstring php-curl php-xml php-pear php-bcmath
apt-get -y install php-mysql
apt-get -y install zip unzip
cp wordpress.conf /etc/nginx/sites-available
ln -s /etc/nginx/sites-available/wordpress.conf  /etc/nginx/sites-enabled/
wget http://wordpress.org/latest.tar.gz
tar -xvzf latest.tar.gz -C /var/www/html
chown www-data: /var/www/html/wordpress/ -R
wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-english.tar.gz
mkdir /var/www/html/phpmyadmin
tar xzf phpMyAdmin-4.9.0.1-english.tar.gz --strip-components=1 -C /var/www/html/phpmyadmin
cp config.inc.php /var/www/html/phpmyadmin/
service mysql start
echo "CREATE DATABASE wordpress;" | mysql -u root
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'localhost';" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root
echo "update mysql.user set plugin = 'mysql_native_password' where user='root';" | mysql -u root
mysql wordpress -u root --password=  < wordpress.sql
#mkdir /var/www/html/wordpress
#unzip wordpress.zip -d /var/www/html/wordpress
#rm wordpress.zip
chmod 660 /var/www/html/phpmyadmin/config.inc.php
chown -R www-data:www-data /var/www/*
chmod -R 755 /var/www/*