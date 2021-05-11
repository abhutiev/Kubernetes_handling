# Kubernetes_handling
⚙️⚙️⚙️ K8's handling

## Services:

• Nginx

• Wordpress

• PhpMyAdmin

• MySQL

• FTPS

• InfluxDB

• Grafana

## Details
• Containers communicate with Telegraph.

• The Kubernetes web dashboard. This will help you manage your cluster.

• The Load Balancer which manages the external access of your services. It will be
the only entry point to your cluster. You must keep the ports associated with the
service (IP:3000 for Grafana etc). Load Balancer will have a single ip.

• A WordPress website listening on port 5050, which will work with a MySQL database.
Both services running in separate containers. The WordPress website has
several users and an administrator. Wordpress uses its own nginx server. The
Load Balancer is able to redirect directly to this service.

• phpMyAdmin, listening on port 5000 and linked with the MySQL database. PhpMyAdmin has its own nginx server. The Load Balancer is able to redirect
directly to this service.

• A container with an nginx server listening on ports 80 and 443. Port 80 will be in
http and should be a systematic redirection of type 301 to 443, which will be in
https.
This container will allow access to a /wordpress route that makes a redirect 307
to IP:WPPORT.
It should also allow access to /phpmyadmin with a reverse proxy to IP:PMAPORT.

• A FTPS server listening on port 21.

• A Grafana platform, listening on port 3000, linked with an InfluxDB database.
Grafana will be monitoring all your containers. You must create one dashboard
per service. InfluxDB and grafana will be in two distincts containers.

• In case of a crash or stop of one of the two database containers, you will have to
make shure the data persist.

• All your containers must restart in case of a crash or stop of one of its component
parts.
