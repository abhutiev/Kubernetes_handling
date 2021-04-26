FROM alpine:3.7

LABEL maintainer="Hutiev Alexander github: abhutiev"

RUN apk update && apk upgrade


RUN mkdir -p /run/openrc && touch /run/openrc/softlevel
RUN apk add --no-cache nginx openssl openssh supervisor openrc
RUN mkdir -p /var/run/sshd


RUN mkdir -p /run/nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY index.html var/www/site/
COPY supervisord.conf /etc/supervisord.conf

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-out /etc/ssl/certs/selfsigned_ssl.crt \
	-keyout /etc/ssl/private/selfsigned_ssl.key \
	-subj "/C=RU/ST=US/L=Boston/O=Celtics/OU=17/CN=localhost"

RUN adduser -D abhutiev echo "abhutiev" | chpasswd && ssh-keygen -A

EXPOSE 80 443 22

CMD supervisord -c /etc/supervisord.conf