#! /usr/bin/env bash
cat /Users/demo/demoprep/client/resetdemo.sh

echo Configuring the Connection Names
source /Users/demo/.bin/config-hostnames.sh

echo Removing Richards Grants
infra grants remove richard@infrahq.com $CIVO_SSH_HOSTNAME
infra grants remove richard@infrahq.com $DO_SSH_HOSTNAME
infra grants remove richard@infrahq.com $CIVO_K8S_NAME
infra grants remove richard@infrahq.com $DO_K8S_NAME

echo Removing Richard from Dev Group
infra groups removeuser richard@infrahq.com Developers

echo Making sure Developers still have Edit Role
infra grants add -g Developers $CIVO_K8S_NAME --role edit
infra grants add -g Developers $DO_K8S_NAME --role edit

echo Clean up Richards VM
# ssh richard@rocky rm /home/richard/.kube/config
scp /Users/demo/demoprep/client/nginx.yaml richard@rocky:/home/richard
ssh richard@rocky kubectl remove -f /home/richard/nginx.yaml
ssh richard@rocky infra logout

echo Reset Complete

# End of the script