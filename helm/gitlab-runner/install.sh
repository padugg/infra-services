#!/bin/bash

helm repo add gitlab https://charts.gitlab.io
helm repo update gitlab

read -s -p "Gitlab Runner Token: " token
export GITLAB_RUNNER_TOKEN=$token

envsubst < values.yaml | helm install --namespace gitlab-system gitlab-runner -f - gitlab/gitlab-runner
