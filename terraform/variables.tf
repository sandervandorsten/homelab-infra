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
  default     = "pve1"
  description = "Name of the VM Host Node in Proxmox"
}

variable "vm_id" {
  type        = string
  description = "VM ID (number) of the guest node."
}

variable "vm_name" {
  type        = string
  description = "Name of the VM Node"
}

variable "vm_description" {
  type        = string
  default     = "Ubuntu server with docker"
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