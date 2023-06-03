resource "proxmox_vm_qemu" "ubuntu_docker_server" {

  # VM General Settings
  target_node = var.node
  vmid        = var.vm_id
  name        = var.vm_name
  desc        = var.vm_description
  qemu_os     = "other"

  # VM Advanced General Settings
  onboot = true

  # VM OS Settings (name of the vm template to clone from)
  clone = var.vm_template_name

  # VM System Settings
  # Needs to be set to increase deployment time according to Christian Lempa
  agent = 1

  # VM CPU Settings
  cores   = var.cores
  sockets = 1
  cpu     = "host"

  # VM Memory Settings
  memory = var.memory

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
  ciuser = var.ciuser

  # Add your SSH KEYs separated by newlines
  sshkeys = <<EOF
    ${var.ssh_key_public}
  EOF
}