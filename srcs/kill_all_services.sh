eval $(minikube docker-env)

echo "Hard killing of nginx"
docker kill  $(docker ps | grep "k8s_nginx_nginx-deployment" | cut -d ' ' -f1)

echo "Hard killing of PhpMyAdmin"
docker kill  $(docker ps | grep "k8s_phpmyadmin_phpmyadmin-deployment" | cut -d ' ' -f1)

echo "Hard killing of WordPress"
docker kill  $(docker ps | grep "k8s_wordpress_wp-deployment" | cut -d ' ' -f1)