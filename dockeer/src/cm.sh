#Installs
apt-get -y update
apt-get -y upgrade
apt-get -y install mariadb-server
mysql -V
apt-get -y install wget
#php
apt-get -y install php
apt-get -y install php-cli php-fpm php-cgi
apt-get -y install php-mysql
apt-get -y install php-mbstring
wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-english.tar.gz
mkdir -p /var/www/localhost
mkdir /var/www/localhost/phpmyadmin
tar xzf phpMyAdmin-4.9.0.1-english.tar.gz --strip-components=1 -C /var/www/localhost/phpmyadmin
cp config.inc.php /var/www/localhost/phpmyadmin/
#nginx
apt-get -y install nginx
service nginx restart
cp /root/nginx/sites-avialable/localhost /etc/nginx/sites-available/localhost
ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/

#MySQL
sh sql.sh

#wordpress
apt-get -y install zip
unzip wordpress.zip -d /var/www/localhost/
cd /var/www/localhost/
/etc/init.d/php7.3-fpm start

#Reboot
chown -R www-data:www-data /var/www/*
chmod -R 755 /var/www/*
cd
cd ..
bash reboot.sh
