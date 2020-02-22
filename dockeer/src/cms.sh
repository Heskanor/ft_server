apt-get -y update
apt-get -y upgrade
apt-get -y install mariadb-server
apt-get -y install wget
apt-get -y  install php-{mbstring,zip,gd,xml,pear,gettext,cgi}
#apt-get -y install php-cli php-fpm php-cgi
#apt-get install -y php php-fpm php-gd php-mysql php-cli php-curl php-json 
apt-get -y install php-mysql
apt-get -y install nginx
apt-get -y install zip unzip
cd
mkdir -p /var/www/localhost
cd ..
cp nginx-host-conf /etc/nginx/sites-available/localhost
ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/
#bash sql.sh
service mysql start
echo "CREATE DATABASE wordpress;" | mysql -u root
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'localhost';" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root
echo "update mysql.user set plugin = 'mysql_native_password' where user='root';" | mysql -u root
mysql wordpress -u root --password=  < wordpress.sql
unzip wordpress.zip -d /var/www/localhost/
rm wordpress.zip

wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-english.tar.gz
mkdir /var/www/localhost/phpmyadmin
tar xzf phpMyAdmin-4.9.0.1-english.tar.gz --strip-components=1 -C /var/www/localhost/phpmyadmin
cp config.inc.php /var/www/localhost/phpmyadmin/
#chmod 660 /var/www/localhost/phpmyadmin/config.inc.php
#chown -R www-data:www-data /var/www/*
#chmod -R 755 /var/www/*
#service mysql restart
#/etc/init.d/php7.3-fpm start
#service nginx restart

apt install gnupg
apt-get -y install wget
apt-get install default-mysql-server

RUN mysql_secure_installation
mysql -u root -p
CREATE DATABASE wordpress;
CREATE USER 'wp_user'@'localhost' IDENTIFIED BY ‘secure_password’;
GRANT ALL ON wordpress.* TO 'wp_user'@'localhost' ;
FLUSH PRIVILEGES;
EXIT;
----
 service mysql start
 service nginx start
 echo "CREATE DATABASE wordpress;" | mysql -u root
 echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'localhost';" | mysql -u root
 echo "FLUSH PRIVILEGES;" | mysql -u root
 echo "update mysql.user set plugin = 'mysql_native_password' where user='root';" | mysql -u root
 mysql wordpress -u root --password=  < wordpress.sql
mkdir /var/www/html/wordpress
 unzip wordpress.zip -d /var/www/html/wordpress
 rm wordpress.zip
 chown www-data: /var/www/html/wordpress/ -R
 wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-english.tar.gz
 mkdir /var/www/html/phpmyadmin
 tar xzf phpMyAdmin-4.9.0.1-english.tar.gz --strip-components=1 -C /var/www/html/phpmyadmin
 cp config.inc.php /var/www/html/phpmyadmin/
 chmod 660 /var/www/html/phpmyadmin/config.inc.php
 chown -R www-data:www-data /var/www/*
 chmod -R 755 /var/www/*
#RUN ["sh","cmd.sh"]
EXPOSE 80 8080
CMD bash reboot.sh && bash
----
RUN service mysql start
RUN service nginx start
RUN echo "CREATE DATABASE wordpress;" | mysql -u root
RUN echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'localhost';" | mysql -u root
RUN echo "FLUSH PRIVILEGES;" | mysql -u root
RUN echo "update mysql.user set plugin = 'mysql_native_password' where user='root';" | mysql -u root
RUN mysql wordpress -u root --password=  < wordpress.sql
mkdir /var/www/html/wordpress
RUN unzip wordpress.zip -d /var/www/html/wordpress
RUN rm wordpress.zip
RUN chown www-data: /var/www/html/wordpress/ -R
RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-english.tar.gz
RUN mkdir /var/www/html/phpmyadmin
RUN tar xzf phpMyAdmin-4.9.0.1-english.tar.gz --strip-components=1 -C /var/www/html/phpmyadmin
RUN cp config.inc.php /var/www/html/phpmyadmin/
RUN chmod 660 /var/www/html/phpmyadmin/config.inc.php
RUN chown -R www-data:www-data /var/www/*
RUN chmod -R 755 /var/www/*
#RUN ["sh","cmd.sh"]
EXPOSE 80 8080
CMD bash reboot.sh && bash