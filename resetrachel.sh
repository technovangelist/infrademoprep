#! /usr/bin/env bash
cat /Users/demo/demoprep/client/resetdemo.sh

echo Configuring the Connection Names
source /Users/demo/.bin/config-hostnames.sh


echo Removing Rachels Grants
infra grants remove rachel@infrahq.com $CIVO_SSH_HOSTNAME
infra grants remove rachel@infrahq.com $DO_SSH_HOSTNAME
infra grants remove rachel@infrahq.com $CIVO_K8S_NAME
infra grants remove rachel@infrahq.com $DO_K8S_NAME

echo Removing Rachel from Dev Group
infra groups removeuser rachel@infrahq.com Developers

echo Making sure Developers still have Edit Role
infra grants add -g Developers $CIVO_K8S_NAME --role edit
infra grants add -g Developers $DO_K8S_NAME --role edit

echo Clean up Rachels VM
# ssh richard@rocky rm /home/richard/.kube/config
scp /Users/demo/demoprep/client/nginx-rachel.yaml rachel@rocky:/home/rachel
ssh richard@rocky kubectl delete -f /home/richard/nginx-rachel.yaml
ssh rachel@rocky infra logout

echo Reset Complete

# End of the script