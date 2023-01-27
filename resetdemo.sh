#! /usr/bin/env bash
echo Setting the Connection Names
source /Users/demo/.bin/config-hostnames.sh

infra grants remove richard@infrahq.com $CIVO_SSH_HOSTNAME
infra grants remove richard@infrahq.com $DO_SSH_HOSTNAME
infra grants remove richard@infrahq.com $CIVO_K8S_NAME
infra grants remove richard@infrahq.com $DO_K8S_NAME
infra groups removeuser richard@infrahq.com Developers

ssh richard@rocky rm /home/richard/.kube/config