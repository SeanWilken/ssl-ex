minikube start

kubectl create ns dev

kubectl apply -f hello-app.yaml

openssl genrsa -out tls.key 2048
openssl req -new -key tls.key -out tls.csr -subj "/CN=medivoice.com"
openssl x509 -req -days 365 -in tls.csr -signkey tls.key -out tls.crt

kubectl create secret tls hello-app-tls --namespace dev --key tls.key --cert tls.crt

kubectl apply -f ingress.yaml

minikube addons enable ingress

# minikube tunnel

# curl https://medivoice.com -kv