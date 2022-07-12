#!/bin/bash
cd ..
echo "Please provide AWS credential for progmmatic acces with terraform..................."
aws configure
pwd
mkdir terraform
mv ./system_setup/main.tf ./terraform/
mv ./system_setup/play1.yml /etc/ansible/
cd terraform/
pwd
echo "Initializing Terraform..........................................."
terraform init
terraform apply
terraform output controller_ip | jq -r > ipfile
export x=$(<ipfile)
echo "Note: EC2key file name will be EC2new.pem............................"
printf "%s ansible_user=ubuntu ansible_ssh_private_key_file=/etc/ansible/EC2new.pem \n" $x > hosts
cat hosts >> /etc/ansible/hosts
cd /etc/ansible/
pwd
echo "Provide EC2new.pem file content...................after copy paste save (ctrl+o) & exit(ctrl+x)"
nano EC2new.pem
chmod 400 EC2new.pem
ansible all -m ping

echo "Initiating Ansible Playbook for basic installation in worker machine............................."
ansible-playbook play1.yml
