# check
# kubectl exec deploy/ftps -- pkill vsftpd
# kubectl exec deploy/grafana -- pkill grafana
# kubectl exec deploy/telegraf -- pkill telegraf
# kubectl exec deploy/influxdb -- pkill influx
# kubectl exec deploy/wordpress -- pkill nginx
# kubectl exec deploy/wordpress -- pkill php-fpm7
# kubectl exec deploy/phpmyadmin -- pkill nginx
# kubectl exec deploy/phpmyadmin -- pkill php-fpm7
# kubectl exec deploy/mysql -- pkill /usr/bin/mysqld 
# kubectl exec deploy/nginx -- pkill nginx
# kubectl exec deploy/nginx -- pkill sshd

minikube start --driver=virtualbox --disk-size="7000mb" --memory="3000mb"

eval $(minikube -p minikube docker-env)

# Делаем metallb
minikube addons enable metallb
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl apply -f ./srcs/yaml/metallb.yaml
# build nginx
docker build -t nginx ./srcs/nginx/
# apply rele nginx
kubectl apply -f ./srcs/yaml/nginx.yaml
# build mysql
docker build -t mysql ./srcs/mysql/
# apply rule mysql
kubectl apply -f ./srcs/yaml/mysql.yaml
# build phpmyadmin
docker build -t phpmyadmin ./srcs/phpmyadmin/
# apply rule phpmyadmin
kubectl apply -f ./srcs/yaml/phpmyadmin.yaml
# build wordpress
docker build -t wordpress ./srcs/wordpress/
# apply rule wordpress
kubectl apply -f ./srcs/yaml/wordpress.yaml
# build influxdb
docker build -t influxdb ./srcs/influxdb
# apply rule influxdb
kubectl apply -f ./srcs/yaml/influxdb.yaml
# build telegraf
docker build -t telegraf ./srcs/telegraf
# apply rule telegraf
kubectl apply -f ./srcs/yaml/telegraf.yaml
# build grafana
docker build -t grafana ./srcs/grafana
# apply rule grafana
kubectl apply -f ./srcs/yaml/grafana.yaml
# build ftps
docker build -t ftps ./srcs/ftps
# apply rule ftps
kubectl apply -f ./srcs/yaml/ftps.yaml

minikube dashboard
