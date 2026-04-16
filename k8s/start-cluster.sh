minikube start -p aibankapp-cluster

kubectl apply -f namespace.yml

kubectl apply -f configMap.yml

kubectl apply -f secrets.yml

kubectl apply -f persistentVolume.yml

kubectl apply -f persistentVolumeClaim.yml

kubectl apply -f mysql-deployment.yml

kubectl apply -f bankapp-deployment.yml

kubectl apply -f ollama-deployment.yml

kubectl apply -f service.yml

kubectl apply -f hpa.yml
