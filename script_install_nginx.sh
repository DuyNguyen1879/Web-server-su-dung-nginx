#!/bin/bash
# install nginx
apt-get -y install nginx
# Tao 1 site index.html co noi dung Huy
mkdir -p /opt/home/nginx
chown -R www-data:www-data /opt/home/nginx/
chmod 755 /opt/home
echo '<html> <head> <title>welcome</title> </head> <body> <h1>Tran Huy</h1> </body> </html>' > /opt/home/nginx/index.html

# Cau hinh site huy voi port 8088 va Root folder o tren
sed 's/80/8088/;s_/usr/share/nginx/html_/opt/home/nginx_' /etc/nginx/sites-available/default > /etc/nginx/sites-available/huy

ln -s /etc/nginx/sites-available/huy /etc/nginx/sites-enabled/huy

/etc/init.d/nginx restart
# Hien thi ket qua
echo -e "\n\n\n";
echo "====== CAI DAT NGINX THANH CONG";
echo CAI DAT NGINX THANH CONG BAN TRUY CAP VAO DIA CHI SAU
ip addr show eth0| grep /24 | awk '{print $2;}'|sed 's/\/.*$//'
echo VOI PORT
awk '/default_server;/ {print $2 }' /etc/nginx/sites-available/huy
echo -e "\n\n\n\n";
