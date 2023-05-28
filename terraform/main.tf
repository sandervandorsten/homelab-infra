module "docker-server" {
  source                   = "./modules/docker_server"
  proxmox_api_token_id     = var.proxmox_api_token_id
  proxmox_api_token_secret = var.proxmox_api_token_secret
  proxmox_api_url          = var.proxmox_api_url
  ssh_key_public           = var.ssh_key_public
  node                     = var.node
  vm_id                    = 104
  vm_name                  = "ubuntu-docker"
  vm_ip_address            = var.vm_ip_address
  gateway_ip               = var.gateway_ip
  vm_template_name         = "ubuntu-docker-template"
  cores                    = 1
  memory                   = 2048
  ciuser                   = "sander"
}