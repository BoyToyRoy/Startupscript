#!/bin/bash

echo 'Goedenavond, u heeft het script geopend. 
echo 'Typ 1 om apache2 te installeren. 
      Typ 2 om mysql-server te installeren. 
      Typ 3 om php te installeren. 

read a
if [ "$a" = "1" ]
	then echo "Apache2 wordt geinstalleerd" 
	sudo apt install apache2
fi 

read a
if [ "$a" = "2" ] 
	then echo "MySQL wordt geinstalleerd"
	sudo apt install mysql-server
	sudo apt install mariadb-server
fi

read a 
if [ "$a" = "3" ] 
	then echo PHP wordt geinstalleerd" 
	sudo apt install php libapache2-mod-php php-mysql
fi 

sudo wget https://download.nextcloud.com/server/releases/nextcloud-21.0.1.zip
sudo apt install unzip

sudo unzip nextcloud-21.0.1.zip -d /var/www/
sudo chown www-data:www-data /var/www/nextcloud/ -R
sudo my sql

 

echo Hierna volgt een opdracht om een user aan te maken in de database 
sudo -u apache /opt/rh/php70/root/usr/bin/php /var/www.html/nextcloud/occ

echo Nu volgt het stukje script wat ervoor zorgt dat certbot geinstalleerd wordt, dit is nodig om het ssl certificaat te installeren
sudo snap install --classic certbot
sudo certbot --apache
sudo certbot --nginx
sudo certbot certonly --webroot
sudo certbot certonly --standalone

echo Het volgende stukje script zorgt ervoor dat Fail2Ban wordt geinstalleerd. 
sudo apt update
sudo apt install fail2ban
sudo systemctl status fail2ban

echo Nu staat Fail2Ban geinstalleerd

