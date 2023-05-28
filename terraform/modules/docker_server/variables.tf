variable "proxmox_api_url" {
  type = string
}

variable "proxmox_api_token_id" {
  type = string
}

variable "proxmox_api_token_secret" {
  type = string
}

variable "ssh_key_public" {
  type        = string
  description = "Public key of the SSH key used for logging into the Virtual Machines"
}

variable "node" {
  type        = string
  description = "Name of the VM Host Node in Proxmox"
}

variable "vm_id" {
  type        = string
  description = "VM ID (number) of the guest node."
}

variable "vm_name" {
  type        = string
  description = "Name of the VM Guest Node"
}

variable "vm_description" {
  type        = string
  default     = "Ubuntu server with docker installed"
  description = "Description of the template"
}

variable "vm_ip_address" {
  type        = string
  description = "IP Address of the ubuntu docker VM on the local network"
}

variable "gateway_ip" {
  type        = string
  description = "IP Address of the Gateway of the internal Network."
}

variable "vm_template_name" {
  type        = string
  description = "Name of the Proxmox VM Template to clone the VM from"
}

variable "cores" {
  type        = number
  description = "Number of cores to use"
}
variable "memory" {
  type        = number
  description = "Memory assigned (MB)"
}
variable "ciuser" {
  type        = string
  description = "User to login to on the VM"
  default     = "sander"
}