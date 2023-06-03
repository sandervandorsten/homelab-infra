module "k3s" {
  source  = "oobenland/k3s/proxmox"
  version = "0.1.4" # Get latest 0.X release

  authorized_keys_file = var.ssh_key_public_path

  proxmox_node = var.node

  node_template         = var.docker-server-config.vm_template_name
  proxmox_resource_pool = "k3s"

  network_gateway = "192.168.0.1"
  lan_subnet      = "192.168.0.0/24"

  support_node_settings = {
    cores  = 1
    memory = 2048
  }

  # Disable default traefik and servicelb installs for metallb and traefik 2
  k3s_disable_components = [
    "traefik",
    "servicelb"
  ]

  master_nodes_count = 1
  master_node_settings = {
    cores  = 1
    memory = 2048
  }

  # 192.168.0.200 -> 192.168.0.207 (6 available IPs for nodes)
  control_plane_subnet = "192.168.0.200/29"

  node_pools = [
    {
      name = "default"
      size = 1
      # 192.168.0.208 -> 192.168.0.223 (14 available IPs for nodes)
      subnet = "192.168.0.208/28"
    }
  ]
}

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