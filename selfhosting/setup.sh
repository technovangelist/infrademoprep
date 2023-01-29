#! /usr/bin/env bash
helm repo add infrahq https://infrahq.github.io/helm-charts
helm repo update

helm install infra-server infrahq/infra-server -f infra-values.yaml

sleep 5

ADMINSECRET=$(kubectl get secret infra-server-initial-admin-secret -o jsonpath='{.data.password}' | base64 -d)

echo "$ADMINSECRET"
