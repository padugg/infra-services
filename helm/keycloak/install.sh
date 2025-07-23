#!/bin/bash

helm install keycloak oci://registry-1.docker.io/bitnamicharts/keycloak -f values.yaml -n keycloak --create-namespace
