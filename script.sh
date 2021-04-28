#!/bin/bash

minikube start --vm-driver=virtualbox
eval $(minikube docker-env)

# Load Balancer turning on
minikube addons enable metrics-server
minikube addons enable metallb

# Dashboard addon turning on
minikube addons enable dashboard

minikube status

kubectl apply -f srcs/metallb.yaml

# Nginx start
docker build  -t nginx_container srcs/nginx/ #--no-cache=true
kubectl apply -f srcs/nginx/nginx.yaml

# PhpMyAdmin start
docker build  -t phpmyadmin_container srcs/phpmyadmin/ #--no-cache=true
kubectl apply -f srcs/phpmyadmin/phpmyadmin.yaml

# WordPress start
docker build  -t wordpress_container srcs/wordpress/ #--no-cache=true
kubectl apply -f srcs/wordpress/wordpress.yaml

minikube addons list
minikube dashboard