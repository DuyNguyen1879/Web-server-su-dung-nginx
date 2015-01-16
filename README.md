#CÀI ĐẶT WEB SERVER SỬ DỤNG NGINX TRÊN UBUNTU
<a name=mucluc></a>
###[Mục lục] (#mucluc)
- [1. Giới thiệu](#gioithieu)
- [2. Cài đặt nginx làm webserver](#caidat)
- [3. Tạo một virtualhost sử dụng nginx](#tao)
- [4. Cấu hình Virtualhost] (#cauhinh)
Cấu hình Virtualhost

<a name="gioithieu"></a>
##1. Giới thiệu

Nginx (phát âm "engine x") là một chương trình server HTTP, một reverse proxy cũng như IMAP/POP3 proxy server miễn phí, mã nguồn mở, có hiệ u năng cao. Nginx được tác giả Igor Sysoev viết cho rambler.ru , trang web đư ợc truy cập nhiều thứ 2 trên nước Nga. Nginx đư ợc biết đến bởi sự ổn định cao, nhiều tính năng, cấu hình đơn giản và tiết kiệm tài nguyên. Hiện nay khoảng 20% website trên toàn thế giới (tức là khoảng 195,974 sites) đang sử dụng ng inx làm webserver (tính đến thời điểm tháng 8 năm 2014)
Nginx hỗ trợ mysql,mariadb Percona , php, python… Nginx hỗ trợ nhiều ngôn ngữ khác nhau như php, python.. hỗ trợ nhiều database như mysql, mariadb, Percona...

[Nguồn](http://wiki.nginx.org/Configuration)

**Một số so sánh về tính năng giữa nginx và các web server khác như apache, lighttpd**

<img src="http://imgur.com/CR91N1J.png">

*Cùng một số lượng request (giống nhau) nhất định chúng ta thấy nginx và lighttpd có tính ổn định hơn về vấn đề sử dụng tài nguyên hệ thống. Trong khi lighttpd có xu hướng tăng dần theo thời gian thì nginx lại ổn định hơn và có xu hướng giảm*

<img src="http://i.imgur.com/4KsP6Me.png">

*Nginx có thể nhận số request gấp khoảng 4 lần so với Apache*
---
<a name="caidat"></a>
##2. Cài đặt nginx làm webserver
- Ta dùng dòng lệnh sau để tiến hành cài đặt
**`sudo apt-get install nginx`**

Sau khi cài đặt truy cập vào tên miền hoặc địa chỉ server nếu thấy như sau là thành công

<img src="http://i.imgur.com/ShV3YmL.png">

---
<a name="tao"></a>
##3. Tạo một virtualhost sử dụng nginx
- Tạo 1 folder làm Document Root cho virtualhost
**`sudo mkdir -p /var/www/nginx-webserver`**
- Cấp quyền sở hữu và thực thi cho folder (Document Root) vừa khởi tạo

**`sudo chown -R www-data:www-data /var/www/nginx-webserver`**

**`sudo chmod 755 /var/www`**

- Tạo một trang có tên **index.html** trong folder (Document Root)

**`sudo vi /var/www/nginx-webserver/index.html`**

Với nội dung như sau

```<html>
  <head>
    <title>Nginx-webserver</title>
  </head>
  <body>
    <h1>install nginx thanh cong</h1>
  </body>
</html>```

---
<a name="cauhinh"></a>
##4. Cấu hình Virtualhost
- Bước này để tạo một tập tin mới có chứa các thông tin về virtual host

Nginx quy định vị trí file này phải được đặt trong sites-avaiable (/etc/nginx/sites-avaiable), vì thế cách đơn giản nhất là copy file cấu hình mặc định của nginx tại /etc/nginx/sites-avaiable để sử dụng

**`sudo cp /etc/nginx/sites-available/default /etc/nginx/sites-available/nginx-webserver`**

- Cấu hình Virtual host sử dụng cổng 8080 và với Document Root /var/www/nginx-webserver vừa tạo ở trên

**`sudo vi/etc/nginx/sites-available/nginx-webserver`**

- Cấu hình môt số thông tin cơ bản sau

<img src="http://i.imgur.com/s6CofGa.png">


- Tạo một liên kết giữa thư mục sites-available và thư mục sites-enabled để kích hoạt host

**`sudo ln -s /etc/nginx/sites-available/nginx-webserver /etc/nginx/sites-enabled/nginx-webserver`**

- Restart nginx

**`sudo service nginx restart`**

- Truy cập vào địa chỉ webserver với port 8080

<img src="http://i.imgur.com/8QCNIQg.png">

- Tương tự, có thể cấu hình 1 virtual host khác sử dụng port 8081

<img src="http://i.imgur.com/ZKao1cj.png"


*THam khảo scrtip cài đăt nginx trên ubuntu tại đây*
(https://github.com/huytm/nginx/blob/master/nginx.sh)
