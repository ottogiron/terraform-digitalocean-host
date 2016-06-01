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
 -var 'domain_name=jumlabs-cd-server' \
 -var 'domain=cd.jumlabs.com' 
 
#If everything is fine run apply
terraform apply -var-file=/Users/ogiron/workspace/jumlabs/inf/digital-ocean-terraform-hosts/digitalocean.tfvars \
 -var 'host_name=continuous-delivery' \
 -var 'provisioner_path=/Users/ogiron/workspace/jumlabs/provisioners/ansible/ansible-server-ci' \
 -var 'provisioner_playbook=site.yml' \
 -var 'provisioner_name=ansible-server-ci' \
 -var 'domain_name=jumlabs-cd-server' \
 -var 'domain=cd.jumlabs.com' 

```

### Variables

#### Digital Ocean API
<table>
    <tr>
        <th>do_token</th>
        <th>empty</th>
        <th>DigitalOcean Personal Access Token</th>
    </tr>
    <tr>
        <td>pub_key</td>
        <td>empty</td>
        <td>public key location, so it can be installed into new droplets</td>
    </tr>
    <tr>
        <td>pvt_key</td>
        <td>empty</td>
        <td>private key location, so Terraform can connect to new droplets</td>
    </tr>
    <tr>
        <td>ssh_fingerpring </td>
        <td>empty</td>
        <td>fingerprint of SSH key</td>
    </tr>
</table>

variable "do_token" {}
variable "pub_key" {}
variable "pvt_key" {}
variable "ssh_fingerprint" {}


#### Host Creation
<table>
    <tr>
        <th>Variable</th>
        <th>Default</th>
        <th>Description</th>
    </tr>
    
    <tr>
        <td>host_name</td>
        <td>empty</td>
        <td>Name of the host to be created</td>
    </tr>
    <tr>
        <td>image</td>
        <td>ubuntu-14-04-x64"</td>
        <td>Base for the host</td>
    </tr>
    <tr>
        <td>region</td>
        <td>nyc2</td>
        <td>Digital ocean region for the host</td>
    </tr>
    <tr>
        <td>size</td>
        <td>512mb</td>
        <td>Digital ocean size of the host</td>
    </tr>
    <tr>
        <td>private_networking</td>
        <td>true</td>
        <td>Enable private networking</td>
    </tr>
    <tr>
        <td>provisioner_path</td>
        <td>empty</td>
        <td>Path of the ansible provisioner for this hosts.</td>
    </tr>
    <tr>
        <td>provisioner_playbook</td>
        <td>empty</td>
        <td>Name of the ansibook playbook to be executed. e.g. playbook.yml</td>
    </tr>
    <tr>
        <td>provisioner_name</td>
        <td>empty</td>
        <td>Name of the ansible module</td>
    </tr>
    <tr>
        <td>provisioner_remote_path</td>
        <td>/opt/jumlabs/provisioner/host</td>
        <td>Path of the ansible provisioner to be executed in the remote host</td>
    </tr>
    <tr>
        <td>domain</td>
        <td>empty</td>
        <td>DNS domain for this host. e.g. jumlabs.com</td>
    </tr>
    <tr>
        <td>domain_name</td>
        <td>empty</td>
        <td>Name to be given to the created DNS domain.</td>
    </tr>
</table>