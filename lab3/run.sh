#!/bin/bash

kubectl create -f pg_configmap.yml
kubectl create -f pg_secret.yml
kubectl create -f pg_service.yml
kubectl create -f pg_deployment.yml
kubectl create -f nextcloud_configmap.yml
kubectl create -f nextcloud_secret.yml
kubectl create -f nextcloud.yml