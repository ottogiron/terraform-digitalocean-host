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
variable "provisioner_name" {}
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
    
    connection {
		user = "root"
		type = "ssh"
		key_file = "${var.pvt_key}"
		timeout = "2m"
	}
    
provisioner "remote-exec" {
  inline = [
        "mkdir -p ${var.provisioner_remote_path}"
        ] 
}    
    
# Copies the provisioner source to
provisioner "file" {
    source = "${var.provisioner_path}"
    destination = "${var.provisioner_remote_path}"
}
  
provisioner "remote-exec" {
  inline = [
        "sudo apt-get update",
        "sudo apt-get -y install software-properties-common",
        "sudo apt-add-repository -y ppa:ansible/ansible",
        "sudo apt-get -y update",
        "sudo apt-get -y install ansible",
        "cd ${var.provisioner_remote_path}/${var.provisioner_name} && ansible-galaxy install -r requeriments.yml --force && ansible-playbook -i \"localhost,\" -c local  ${var.provisioner_playbook}"
        ] 
}
}