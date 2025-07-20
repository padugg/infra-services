#!/bin/bash

helm upgrade --install ingress-nginx ingress-nginx \
  --repo https://kubernetes.github.io/ingress-nginx \
  --namespace ingress-nginx --create-namespace \
  --set tcp."22"="gitlab-system/gitlab-gitlab-shell:22"
