FROM alpine:3.7

RUN apk update && apk upgrade
RUN apk add --no-cache nginx supervisor wget \
        php7 php7-fpm php7-opcache php7-gd php7-iconv php7-mysqli php7-mbstring php7-json php7-session

RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-english.tar.gz && \
        tar -xzvf phpMyAdmin-5.0.4-english.tar.gz && rm -f phpMyAdmin-5.0.4-english.tar.gz
RUN mv phpMyAdmin-5.0.4-english /etc/phpMyAdmin && mkdir -p var/run/php
RUN mkdir -p /etc/phpMyAdmin/tmp && chmod 777 /etc/phpMyAdmin/tmp
COPY config.inc.php /etc/phpMyAdmin/

RUN mkdir -p /var/run/nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf

COPY supervisord.conf /etc/supervisord.conf

EXPOSE 5000
CMD supervisord -c /etc/supervisord.conf