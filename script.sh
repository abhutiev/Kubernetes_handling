minikube start --vm-driver=docker
minikube status
minikube addons enable dashboard
minikube addons enable metallb
kubectl apply -f srcs/metallb.yaml
minikube addons list
minikube dashboard