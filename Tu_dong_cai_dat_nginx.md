# Cài đặt nginx tự động bằng scritp trên ubuntu 14.04
##1. Download scrip tại [đây] (https://www.dropbox.com/s/k6a3hojhfprpvix/nginx.sh?dl=0) hoặc tạo một file **nginx.sh** với nội dung như sau

`sudo vi nginx.sh`

```
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

echo "====== CAI DAT NGINX THANH CONG"
echo CAI DAT NGINX THANH CONG BAN TRUY CAP VAO DIA CHI SAU
ip addr show eth0| grep /24 | awk '{print $2;}'|sed 's/\/.*$//'
echo VOI PORT
awk '/default_server;/ {print $2 }' /etc/nginx/sites-available/huy
```

##2. Cấp quyền thực thi (excute) cho file script (đảm bảo với các user thuộc nhóm o (other) cung có thể thực hiện được file

`sudo chmod +x nginx.sh`
<img src="http://i.imgur.com/EEf2KIS.png">

##3. Chạy file

`sudo ./nginx.sh`

##4. Truy cập vào địa chỉ server với thông báo hiển thị trên màn hình
<img src="http://i.imgur.com/9TRFA7W.png">