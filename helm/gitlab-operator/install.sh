#!/bin/bash

helm repo add gitlab https://charts.gitlab.io
helm repo update

helm install gitlab-operator gitlab/gitlab-operator \
  --create-namespace \
  --namespace gitlab-system

kubectl apply -f gitlab.yaml -n gitlab-system
