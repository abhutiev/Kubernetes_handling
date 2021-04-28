FROM alpine:3.12

RUN apk update && apk upgrade

RUN apk add nginx supervisor wget \
       php7 php7-fpm php7-mysqli php7-mbstring php7-json php7-session

RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache && \
		wget https://files.phpmyadmin.net/phpMyAdmin/4.9.2/phpMyAdmin-4.9.2-all-languages.tar.gz && \
		tar -xzvf phpMyAdmin-4.9.2-all-languages.tar.gz && \
		rm -rf phpMyAdmin-4.9.2-all-languages.tar.gz && \
		mkdir -p /www /etc/telegraf && mv phpMyAdmin-4.9.2-all-languages /www/phpmyadmin

COPY ./config.inc.php /www/phpMyAdmin/
COPY ./nginx.conf /etc/nginx/conf.d/default.conf
COPY ./supervisord.conf /etc/supervisord.conf
COPY ./telegraf.conf			/etc/telegraf/

RUN mkdir -p /run/nginx

EXPOSE 5000

COPY ./launch.sh ./
RUN chmod 777 launch.sh
CMD sh launch.sh