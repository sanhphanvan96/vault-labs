#!/bin/bash

read -r token < ../vault/.app-reader.vault-token
export VAULT_TOKEN="$token"

set -x

ansible-playbook -i hosts vault.yml
ansible-playbook -i hosts deploy.yml
