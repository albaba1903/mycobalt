#!/bin/bash
set -e

if [ "$#" -ne 1 ] ; then
  echo "Usage:  $0 APP_UUID" >&2
  exit 1
fi

export APP_UUID=$1
export secrets="$(cat ./bin/vault-secrets.txt | xargs)"

export token_ttl_value=
export VAULT_TOKEN=
export APP_UUID=`echo $APP_UUID | sed -e "s/-//g"`

echo Unsealing vault
export VAULT_TOKEN=`grep 'Unseal Key 1'  /var/vault/config/init.keys | awk '{print $NF}'`
vault unseal -address=${VAULT_ADDR} $VAULT_TOKEN
export VAULT_TOKEN=`grep 'Initial Root Token'  /var/vault/config/init.keys | awk '{print $NF}'`
vault write secret/$APP_UUID $secrets

echo Stored the secrets