#! /usr/bin/env bash
echo Setting the Connection Names
source ./config-hostnames.sh

infra grants remove richard@infrahq.com $CIVO_SSH_HOSTNAME
infra grants remove richard@infrahq.com $DO_SSH_HOSTNAME
infra grants remove richard@infrahq.com $CIVO_K8S_NAME
infra grants remove richard@infrahq.com $DO_K8S_NAME

ssh richard@rocky rm /home/richard/.kube/config