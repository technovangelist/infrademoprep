#! /usr/bin/env bash
cat /Users/demo/demoprep/client/resetdemo.sh

echo Setting the Connection Names
source /Users/demo/.bin/config-hostnames.sh

infra grants remove richard@infrahq.com $CIVO_SSH_HOSTNAME
infra grants remove richard@infrahq.com $DO_SSH_HOSTNAME
infra grants remove richard@infrahq.com $CIVO_K8S_NAME
infra grants remove richard@infrahq.com $DO_K8S_NAME
infra groups removeuser richard@infrahq.com Developers
infra grants add -g Developers $CIVO_K8S_NAME --role edit
infra grants add -g Developers $DO_K8S_NAME --role edit

ssh richard@rocky rm /home/richard/.kube/config
scp /Users/demo/demoprep/client/nginx.yaml richard@rocky:/home/richard
