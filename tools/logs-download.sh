#!/bin/bash

set -o errexit
set -o nounset

VM_IP=$(cat /uma-automator/terraform/compute/terraform.tfstate | jq -r '.modules[0].resources | map([.primary.attributes["network_interface.0.access_config.0.nat_ip"]] | join("")) | sort | .[]')

echo "Conecting to VM..."

scp -i /home/uma/.ssh/id_rsa uma@$VM_IP:/home/uma/uma-bot-logs.log .
