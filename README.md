# Terraform Digital Ocean Host Module #

## Terraform module for getting a bare bones digital ocean host. The host is provisioned using an ansible module.

### Example

```
#Run the plan
terraform plan -var-file=/Users/ogiron/workspace/jumlabs/inf/digital-ocean-terraform-hosts/digitalocean.tfvars \
 -var 'host_name=continuous-delivery' \
 -var 'provisioner_path=/Users/ogiron/workspace/jumlabs/provisioners/ansible/ansible-server-ci' \
 -var 'provisioner_playbook=site.yml' \
 -var 'provisioner_name=ansible-server-ci' \
 -var 'domain_name=cd' \
 -var 'domain=jumlabs.com'
 
#If everything looks good
terraform apply -var-file=/Users/ogiron/workspace/jumlabs/inf/digital-ocean-terraform-hosts/digitalocean.tfvars \
 -var 'host_name=continuous-delivery' \
 -var 'provisioner_path=/Users/ogiron/workspace/jumlabs/provisioners/ansible/ansible-server-ci' \
 -var 'provisioner_playbook=site.yml' \
 -var 'provisioner_name=ansible-server-ci' \
 -var 'domain_name=cd' \
 -var 'domain=jumlabs.com'
```

### Variables

#### Digital Ocean API

| Variable         | Default | Description                                                    |
|------------------|---------|----------------------------------------------------------------|
| do\_token        | empty   | DigitalOcean Personal Access Token                             |
| pub\_key         | empty   | public key location, so it can be installed into new droplets  |
| pvt\_key         | empty   | private key location, so Terraform can connect to new droplets |
| ssh\_fingerprint | empty   | fingerprint of SSH key                                         |

#### Host

| Variable                  | Default                       | Description                                                                 |
|---------------------------|-------------------------------|-----------------------------------------------------------------------------|
| host\_name                | empty                         | Name of the host to be created                                              |
| image                     | ubuntu-14-04-x64"             | Base for the host                                                           |
| region                    | nyc2                          | Digital ocean region for the host                                           |
| size                      | 512mb                         | Digital ocean size of the host                                              |
| private\_networking       | true                          | Enable private networking                                                   |
| provisioner\_path         | empty                         | Path of the ansible provisioner for this hosts.                             |
| provisioner\_playbook     | empty                         | Name of the ansibook playbook to be executed. e.g. playbook.yml             |
| provisioner\_name         | empty                         | Name of the ansible module                                                  |
| provisioner\_remote\_path | /opt/jumlabs/provisioner/host | Path of the ansible provisioner to be executed in the remote host           |
| domain                    | empty                         | Existing Digital Ocean DNS in which the host will be added e.g. jumlabs.com |
| domain\_name              | empty                         | Domain name e.g cd will create cd.jumlabs.com                               |

