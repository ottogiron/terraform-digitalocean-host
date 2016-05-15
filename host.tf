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

resource "digitalocean_droplet" "digitalocean_host" {
    image = "${var.image}"
    name = "${var.host_name}"
    region = "${var.region}"
    size = "${var.size}"
    private_networking = "${var.private_networking}"
    ssh_keys = [
      "${var.ssh_fingerprint}"
    ]
}