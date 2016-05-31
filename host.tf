variable "host_name" {}

variable "image" {
    default = "ubuntu-14-04-x64"
}
variable "region" { 
    default = "nyc2"
}
variable "size" {
    default = "512mb"
}
variable "private_networking" {
    default = true
}       

variable "provisioner_path" {}
variable "provisioner_playbook" {}
variable "provisioner_remote_path" {
    default = "/opt/jumlabs/provisioner/host"
}

resource "digitalocean_droplet" "digitalocean_host" {
    image = "${var.image}"
    name = "${var.host_name}"
    region = "${var.region}"
    size = "${var.size}"
    private_networking = "${var.private_networking}"
    ssh_keys = [
      "${var.ssh_fingerprint}"
    ]
    
# Copies the configs.d folder to /etc/configs.d
provisioner "file" {
    source = "${var.provisioner_path}"
    destination = "${var.provisioner_remote_path}"
}
  
provisioner "remote-exec" {
  inline = [
        "sudo apt-get update",
        "sudo apt-get install software-properties-common",
        "sudo apt-add-repository ppa:ansible/ansible",
        "sudo apt-get update",
       "sudo apt-get install ansible",
        "cd ${var.provisioner_remote_path}  && ansible-playbook ${var.provisioner_playbook}"
        ] 
}
}