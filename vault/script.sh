#!/bin/bash

read -r token < .vault-token
export VAULT_ADDR="http://127.0.0.1:8200"
export VAULT_TOKEN="$token"

set -x
vault status
vault secrets enable -path=apps kv-v2

sleep 5
vault kv put apps/my-app APP_TOKEN="THIS_IS_A_TOKEN_FROM_VAULT"
vault kv get apps/my-app
vault kv get -field=APP_TOKEN apps/my-app

cat app-policy.hcl
vault policy write app-reader app-policy.hcl
vault token create -display-name app-reader -explicit-max-ttl 8760h -policy app-reader -ttl 720h -renewable
echo "The token above is used for ansible. To use it, export VAULT_TOKEN=hvs.xxx"