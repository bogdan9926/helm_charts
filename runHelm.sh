kubectl apply -f charts/envmap.yaml
kubectl apply -f  charts/secretmap.yaml
helm install ingress-nginx oci://ghcr.io/nginxinc/charts/nginx-ingress --version 1.0.0
helm upgrade --install release charts/corpool/. --set test-app-api.image.tag="0.1.0"   --set test-app-service.image.tag="0.1.0"   --debug 

helm install mongo -f charts/corpool/mongoValues.yaml oci://registry-1.docker.io/bitnamicharts/mongodb

helm install rabbitmq -f charts/corpool/rabbitValues.yaml oci://registry-1.docker.io/bitnamicharts/rabbitmq
helm install redis -f charts/corpool/redisValues.yaml oci://registry-1.docker.io/bitnamicharts/redis
