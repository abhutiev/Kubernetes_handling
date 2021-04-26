FROM alpine:3.7

RUN apk update && apk upgrade
RUN apk add --no-cache wget bash supervisor nginx php7 php7-fpm php7-opcache php7-gd php7-iconv php7-mysqli \
        php7-mbstring php7-json php7-session

RUN wget https://wordpress.org/latest.tar.gz
RUN tar xfz latest.tar.gz && rm latest.tar.gz
RUN mv wordpress /var/www/
COPY wp-config.php /var/www/wordpress/wp-config.php

RUN mkdir -p /var/run/nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf

RUN mkdir -p /var/run/php
COPY supervisord.conf /etc/supervisord.conf

EXPOSE 5050
CMD supervisord -c /etc/supervisord.conf