
resource "proxmox_vm_qemu" "ubuntu_docker_server" {

  # VM General Settings
  target_node = var.node
  vmid        = var.vm_id
  name        = var.vm_name
  desc        = var.vm_description

  # VM Advanced General Settings
  onboot = true

  # VM OS Settings (name of the vm template to clode from)
  clone = "ubuntu-docker-template"

  # VM System Settings
  agent = 1

  # VM CPU Settings
  cores   = 1
  sockets = 1
  cpu     = "host"

  # VM Memory Settings
  memory = 2048

  # VM Network Settings
  network {
    bridge = "vmbr0"
    model  = "virtio"
  }

  # VM Cloud-Init Settings
  os_type = "cloud-init"

  # IP Address and Gateway
  ipconfig0 = "ip=${var.vm_ip_address}/24,gw=${var.gateway_ip}"

  # User for login
  ciuser = "sander"

  # (Optional) Add your SSH KEY
  sshkeys = <<EOF
    ${var.ssh_key_public}
  EOF
}