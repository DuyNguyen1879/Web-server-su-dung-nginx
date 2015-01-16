#CÀI ĐẶT WEB SERVER SỬ DỤNG NGINX TRÊN UBUNTU
##1. Giới thiệu
Nginx (phát âm "engine x") là một chương trình server HTTP, một reverse proxy cũng như IMAP/POP3 proxy server miễn phí, mã nguồn mở, có hiệ u năng cao. Nginx được tác giả Igor Sysoev viết cho rambler.ru , trang web đư ợc truy cập nhiều thứ 2 trên nước Nga. Nginx đư ợc biết đến bởi sự ổn định cao, nhiều tính năng, cấu hình đơn giản và tiết kiệm tài nguyên. Hiện nay khoảng 20% website trên toàn thế giới (tức là khoảng 195,974 sites) đang sử dụng ng inx làm webserver (tính đến thời điểm tháng 8 năm 2014)
Nginx hỗ trợ mysql,mariadb Percona , php, python… Nginx hỗ trợ nhiều ngôn ngữ khác nhau như php, python.. hỗ trợ nhiều database như mysql, mariadb, Percona...

[Nguồn](http://wiki.nginx.org/Configuration)

**Một số so sánh về tính năng giữa nginx và các web server khác như apache, lighttpd**

<img src="http://imgur.com/CR91N1J.png">

*Cùng một số lượng request (giống nhau) nhất định chúng ta thấy nginx và lighttpd có tính ổn định hơn về vấn đề sử dụng tài nguyên hệ thống. Trong khi lighttpd có xu hướng tăng dần theo thời gian thì nginx lại ổn định hơn và có xu hướng giảm*

<img src="http://i.imgur.com/4KsP6Me.png">

*Nginx có thể nhận số request gấp khoảng 4 lần so với Apache*