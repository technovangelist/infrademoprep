#! /usr/bin/env bash
echo Verifying Infra Login
source ./verifyinfralogin.sh
if [ $? -eq 1 ];then 
  [[ "$0" = "$BASH_SOURCE" ]] && exit 1 || return 1
fi

echo Setting the Connection Names
source ./config-hostnames.sh

ALLADMINS=("matt.williams" "jeff" "michael" "michael.yang" "daniel.nephin" "bruce.macdonald" "patrick.divine" "eva.ho")

for user in "${ALLADMINS[@]}"
do
  infra users add "$user"@infrahq.com
  infra groups adduser "$user"@infrahq.com Admin
  infra grants add "$user"@infrahq.com infra --role admin
  infra grants add "$user"@infrahq.com "$CIVO_SSH_HOSTNAME"
  infra grants add "$user"@infrahq.com "$DO_SSH_HOSTNAME"
done

infra grants add -g Admin $DO_K8S_NAME --role cluster-admin
infra grants add -g Admin $CIVO_K8S_NAME --role cluster-admin