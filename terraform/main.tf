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
