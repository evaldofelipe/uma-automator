#!/bin/bash

set -o errexit
set -o nounset

VM_IP=$(cat /uma-automator/terraform/compute/terraform.tfstate | jq -r '.modules[0].resources | map([.primary.attributes["network_interface.0.access_config.0.nat_ip"]] | join("")) | sort | .[]')

echo "Conecting to VM..."

ssh -i /home/uma/.ssh/id_rsa uma@$VM_IP 'sudo docker logs uma_bot_test >& /home/uma/uma-bot-logs.log && tail -f /home/uma/uma-bot-logs.log'
