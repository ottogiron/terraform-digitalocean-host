# Terraform Digital Ocean Host Module #

## Terraform module for getting a bare bones digital ocean host.

### Example

```
#Run the plan
terraform plan -var-file=/Users/ogiron/workspace/jumlabs/inf/digital-ocean-terraform-hosts/digitalocean.tfvars \
 -var 'host_name=continuous-delivery' \
 -var 'provisioner_path=/Users/ogiron/workspace/jumlabs/provisioners/ansible/ansible-server-ci' \
 -var 'provisioner_playbook=site.yml'
 
#If everything is fine run apply

terraform apply -var-file=/Users/ogiron/workspace/jumlabs/inf/digital-ocean-terraform-hosts/digitalocean.tfvars \
 -var 'host_name=continuous-delivery' \
 -var 'provisioner_path=/Users/ogiron/workspace/jumlabs/provisioners/ansible/ansible-server-ci' \
 -var 'provisioner_playbook=site.yml'

```