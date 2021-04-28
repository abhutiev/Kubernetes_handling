FROM	alpine:3.12

RUN		apk update
RUN		apk upgrade

RUN		echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN		apk add influxdb openrc telegraf
RUN		openrc
RUN		touch /run/openrc/softlevel

COPY ./telegraf.conf /etc/
COPY	./launch.sh      /
RUN chmod +x launch.sh

VOLUME	["/var/lib/influxdb"]

EXPOSE	8086

ENTRYPOINT  sh launch.sh