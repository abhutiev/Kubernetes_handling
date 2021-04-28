FROM	alpine:3.12

RUN		apk update && apk upgrade

RUN		apk add vsftpd openssl supervisor
RUN		apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

RUN		echo "root:root" | chpasswd

RUN		openssl req -x509 -nodes -days 365 \
		-newkey rsa:2048 -subj "/C=RU/ST=Kazan/L=Kazan/O=21/OU=abhutiev/CN=localhost" \
		-keyout /etc/ssl/private/vsftpd.key \
		-out /etc/ssl/certs/vsftpd.crt
COPY	./supervisord.conf /etc/supervisord.conf
COPY	./telegraf.conf /etc/telegraf/
COPY	./vsftpd.conf /etc/vsftpd/
COPY	./launch.sh .
RUN chmod +x launch.sh

EXPOSE  21 30021

ENTRYPOINT	sh launch.sh