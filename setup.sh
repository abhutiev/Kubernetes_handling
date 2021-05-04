#  Start Minukube
minikube start --vm-driver=virtualbox --vm-driver=virtualbox --cpus=4 --memory=4G --disk-size=50G
minikube ssh 'sudo mkdir /mnt/influxdb; sudo chmod 777 /mnt/influxdb'


minikube addons enable metrics-server
minikube addons enable metallb
eval $(minikube docker-env)


#  Build Docker Images

#                   NGINX

echo "Docker build Nginx"
echo -e "While waiting for nginx start, you can think under question from Что? Где? Когда?"
echo -n "⌛ В рассказе о сербской знахарке ЙовАнке корреспондент передачи \"Их нравы\" говорит, что она многое умеет:\
лечит и сердце, и желудок, и почки, ну, а ДЕЛАТЬ ЭТО она умеет лучше всего. Какие два слова, начинающиеся на\
одну и ту же букву, мы заменили словами \"ДЕЛАТЬ ЭТО\"?"
docker build -t nginx_image srcs/nginx
echo "Nginx started"
echo "Ответ: Заговаривать зубы"

#                   WORDPRESS

echo "Docker build Wordpress"
echo "While waiting for wordpress start, you can think under question from Что? Где? Когда?"
echo "⌛ Картасуру, древнюю столицу яванского королевства, позднее сменила на этом посту соседняя Суракарта.\
Назовите современное государство, события 1868 года в котором, по мнению сайта Wordsmith.Org,\
стоят в одном ряду с упомянутым фактом."
docker build -t wordpress_image srcs/wordpress
echo "Ответ: Япония"
echo "WordPress started"


#                   MYSQL

echo "Docker build Mysql"
docker build -t mysql_image srcs/mysql


#                   PHPMYADMIN

echo "Docker build Phpmyadmin"
echo "While waiting for phpmyadmin restart, you can think under question from Что? Где? Когда?"
echo "⌛ ЕЕ покупали заранее, мелкими партиями, причем — что выглядит особо цинично — в Западной Германии. \
Вся ОНА пошла в дело за одну августовскую ночь. Назовите ЕЕ двумя словами.?"
docker build -t phpmyadmin_image srcs/phpmyadmin
echo "Ответ: Колючая проволока"
echo "PhpMyAdmin started"

#                   FTPS

echo "Docker build Ftps"
docker build -t ftps_image srcs/ftps

#                   GRAPHANA

echo "Docker build Grafana"
docker build -t grafana_image srcs/grafana

#                   INFLUXDB

echo "Docker build Influxdb\n\n"
docker build -t influxdb_image srcs/influxdb


#                   YAMLS

kubectl apply -f srcs/metallb.yaml
kubectl apply -f srcs/nginx/nginx.yaml
kubectl apply -f srcs/mysql/mysql.yaml
kubectl apply -f srcs/ftps/ftps.yaml
kubectl apply -f srcs/phpmyadmin/phpmyadmin.yaml
kubectl apply -f srcs/wordpress/wordpress.yaml
kubectl apply -f srcs/grafana/grafana.yaml
kubectl apply -f srcs/influxdb/influxdb.yaml
#  Create secret
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
#  Dashboard
minikube dashboard

