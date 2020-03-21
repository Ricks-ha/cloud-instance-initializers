#!/usr/bin/env bash
apt-get update

apt install nginx -y
systemctl start nginx
systemctl enable nginx

ufw allow ssh
ufw allow http
ufw allow https
ufw enable


# MySQL
apt install mysql-server mysql-client -y
systemctl start mysql
systemctl enable mysql


# PHP-FPN
apt install php7.2 php7.2-fpm php7.2-cli php7.2-curl php7.2-mysql php7.2-zip php7.2-curl php7.2-gd php7.2-mbstring php-pear -y
systemctl start php7.2-fpm
systemctl enable php7.2-fpm


# Verify the sock is open
netstat -pl | grep php

add-apt-repository ppa:certbot/certbot
apt-get update
apt-get install python-certbot-nginx -y



certbot --nginx -m ${ADMIN_EMAIL}  --agree-tos -d ${DOMAIN}

(crontab -l 2>/dev/null; echo "0 12 * * * /usr/bin/certbot renew --quiet") | crontab -


nginx -t && nginx -s reload