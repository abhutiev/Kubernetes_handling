FROM	alpine:3.12

# Update
RUN		apk update && apk upgrade

RUN		apk add mariadb mariadb-client supervisor
RUN		apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

RUN		mkdir -p /run/mysqld/

COPY	./supervisord.conf	/etc/supervisord.conf
COPY 	./telegraf.conf		   /etc/telegraf/
COPY	./my.cnf			/etc/
COPY	./wordpress.sql		   ./
COPY	./launch.sh			./
RUN chmod +x launch.sh

EXPOSE	3306

VOLUME	["var/lib/mysql"]

########
CMD	sh launch.sh
########