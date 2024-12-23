#!/bin/bash

minikube status || minikube start

docker build -t flask-app:latest ./app
minikube image load flask-app:latest

kubectl apply -f postgres-secret.yml
kubectl apply -f app-configmap.yml
kubectl apply -f postgres-deployment.yml
kubectl apply -f postgres-service.yml
kubectl apply -f app-deployment.yml
kubectl apply -f app-service.yml
