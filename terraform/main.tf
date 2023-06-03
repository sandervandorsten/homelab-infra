#data "terraform_remote_state" "static" {
#  backend           = "local"
#  public_lb_subnets = ["list"]
#
#  config = {
#    path = "..."
#  }
#}
#
#data "aws_kms_secret" "teleport_tokens" {
#  trusted_cluster = ""
#  node            = ""
#}

## Installation of Teleport proxy on an EC2 in AWS
#module "teleport_ec2" {
#  source               = "github.com/skyscrapers/terraform-teleport//teleport-server?ref=7.2.3"
#  ami_id               = "ami-9d6324e4"
#  teleport_auth_tokens = ["", ""]
#  environment          = terraform.workspace
#  r53_zone             = "production.skyscrape.rs"
#  project              = "int"
#  subnet_id            = ""
#  key_name             = "iuri"
#  letsencrypt_email    = "sandervandorsten@gmail.com"
#}



#resource "aws_route53_zone" "primary" {
#  name = "sandervandorsten.com"
#
#  tags = var.default_tags
#}

# Docker Server installation on the Proxmox Homelab
module "docker-server" {
  source                   = "./modules/docker_server"
  proxmox_api_token_id     = var.proxmox_api_token_id
  proxmox_api_token_secret = var.proxmox_api_token_secret
  proxmox_api_url          = var.proxmox_api_url
  ssh_key_public           = var.ssh_key_public
  node                     = var.node
  gateway_ip               = var.gateway_ip
  vm_id                    = var.docker-server-config.vm_id
  vm_name                  = var.docker-server-config.vm_name
  vm_ip_address            = var.docker-server-config.vm_ip_address
  vm_template_name         = var.docker-server-config.vm_template_name
  cores                    = var.docker-server-config.cores
  memory                   = var.docker-server-config.memory
  ciuser                   = var.docker-server-config.ciuser
}