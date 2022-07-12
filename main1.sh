#!/bin/bash
mv ./main.tf ./../terraform/
terraform apply
terraform output controller.controller_ip | jq -r > ipfile
export x=$(<ipfile)
print "%s user=ubuntu key=EC2new" "$x" > hosts
