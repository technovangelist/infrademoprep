#! /usr/bin/env bash
if infra info 2> /dev/null | grep -q 'Server: demo.infrahq.com' &> /dev/null; then
   # if body
   echo "You are logged into Infra on the Demo domain"
elif infra info 2> /dev/null | grep -q 'Server:' &> /dev/null; then
   echo "You are logged into another Infra domain. Log out and then login to demo.infrahq.com"
   [[ "$0" = "$BASH_SOURCE" ]] && exit 1 || return 1
else
   infra login demo.infrahq.com
fi
