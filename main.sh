#!/bin/bash
cd ..
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update && sudo apt-get install terraform
sudo apt-get install fontconfig openjdk-11-jre -y
sudo apt update
sudo apt install software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install ansible
sudo apt install awscli
cat "installtion of Terraform java Ansible to current system completed."
cat "To launch instance choose right main.tf in main1.sh it will further lead the process."
