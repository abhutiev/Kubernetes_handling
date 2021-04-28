FROM alpine:3.12

LABEL maintainer="Hutiev Alexander github: abhutiev"

RUN apk update && apk upgrade
RUN apk add nginx openssl openssh supervisor
RUN	apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

RUN echo "abhutiev:abhutiev" | chpasswd

RUN mkdir -p /run/nginx

COPY ./nginx.conf		/etc/nginx/conf.d/default.conf
COPY ./index.html		var/www/
COPY ./supervisord.conf	/etc/supervisord.conf
COPY ./telegraf.conf	/etc/telegraf/

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-out /etc/ssl/certs/ssl.crt \
	-keyout /etc/ssl/private/ssl.key \
	-subj "/C=RU/ST=US/L=Boston/O=Celtics/OU=17/CN=localhost"

EXPOSE 80 443 22

COPY launch.sh	.
RUN chmod 777 launch.sh
CMD sh launch.sh