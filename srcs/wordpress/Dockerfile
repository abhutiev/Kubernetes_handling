FROM alpine:3.7

RUN     apk update && apk upgrade
RUN	apk add wget php7 php7-fpm php7-mysqli php7-mbstring php7-json php7-session supervisor \
        lighttpd php7-common php7-iconv php7-gd php7-curl php7-xml php7-imap php7-cgi nginx \
        fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix \
        php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom \
        telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

RUN		mkdir -p /usr/share/webapps/ && cd /usr/share/webapps/ && \
		wget https://wordpress.org/latest.tar.gz && tar -xzvf latest.tar.gz && \
		rm -rf latest.tar.gz && chown -R lighttpd /usr/share/webapps/ && \
		ln -s /usr/share/webapps/wordpress/ /var/www/localhost/htdocs/wordpress


COPY	./telegraf.conf		/etc/telegraf/
COPY	./wp-config.php		/usr/share/webapps/wordpress/
COPY	./supervisord.conf	/etc/supervisord.conf
COPY	./nginx.conf		/etc/nginx/conf.d/default.conf

RUN     mkdir -p /var/run/nginx
COPY    nginx.conf /etc/nginx/conf.d/default.conf

RUN		mkdir -p /run/nginx
RUN		mkdir -p /var/run/php

EXPOSE  5050

COPY	./launch.sh             ./
RUN     chmod 777 launch.sh
CMD     sh launch.sh