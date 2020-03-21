Execute the init script with domain and admin email set.

#### Configure nginx

Uncomment the following lines from `/etc/nginx/sites-enabled/default`:
```
        location ~ \.php$ {
                include snippets/fastcgi-php.conf;
                fastcgi_pass unix:/var/run/php/php7.2-fpm.sock;
        }

```
Use the socket found via `netstat -pl | grep php` 

Allow index.php as index file by adding it to the list:
```
index index.html index.htm index.nginx-debian.html index.php;

```

#### Configure PHP-FPM

Go to the `/etc/php/7.2` directory and edit the 'php.ini' file.
```
cd /etc/php/7.2/`
nano fpm/php.ini
```

Uncomment the 'cgi.fix_patinfo' line and change the value to '0'.
```
cgi.fix_pathinfo=0
```

Reload the PHP-FPM service.
```
systemctl reload php7.2-fpm
```



See [this link](https://www.howtoforge.com/tutorial/how-to-install-nginx-with-php-and-mysql-lemp-on-ubuntu-1804/)