FROM	alpine:3.12

RUN		apk update && apk upgrade

RUN		apk add nginx openssl openssh supervisor
RUN		apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

RUN		echo "root:root" | chpasswd

RUN		mkdir -p /run/nginx

COPY	telegraf.conf		/etc/telegraf/
COPY	nginx.conf		/etc/nginx/conf.d/default.conf
COPY	supervisord.conf	/etc/supervisord.conf
COPY	index.html 		/var/www
COPY	launch.sh		.
RUN		chmod +x launch.sh

RUN		openssl req -x509 -nodes -days 365 \
		-newkey rsa:2048 \
		-keyout /etc/ssl/private/nginx.key \
		-out /etc/ssl/certs/nginx.crt  -subj "/C=RU/ST=Kazan/L=Kazan/O=21/OU=abhutiev/CN=localhost"

# Ports
EXPOSE	80 443 22

CMD		sh launch.sh