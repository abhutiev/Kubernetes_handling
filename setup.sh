#  Start Minukube
minikube start --vm-driver=virtualbox --vm-driver=virtualbox --cpus=4 --memory=4G --disk-size=50G
minikube ssh 'sudo mkdir /mnt/influxdb; sudo chmod 777 /mnt/influxdb'


minikube addons enable metrics-server
minikube addons enable metallb
eval $(minikube docker-env)


#  Build Docker Images

#                   NGINX

echo "Docker build Nginx"
docker build -t nginx_image srcs/nginx
echo "Nginx started"

#                   WORDPRESS

echo "Docker build Wordpress"
docker build -t wordpress_image srcs/wordpress
echo "WordPress started"


#                   MYSQL

echo "Docker build Mysql"
docker build -t mysql_image srcs/mysql
echo "MySQL started"


#                   PHPMYADMIN

echo "Docker build Phpmyadmin"
docker build -t phpmyadmin_image srcs/phpmyadmin > tmp 2>&1
echo "PhpMyAdmin started"

#                   FTPS

echo "Docker build Ftps"
docker build -t ftps_image srcs/ftps
echo "FTPS started"

#                   GRAPHANA

echo "Docker build Grafana"
docker build -t grafana_image srcs/grafana
echo "Grafana started"

#                   INFLUXDB

echo "Docker build Influxdb"
docker build -t influxdb_image srcs/influxdb
echo "InfluxDB started"


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

