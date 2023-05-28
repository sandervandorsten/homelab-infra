variable "proxmox_api_url" {
  type = string
}

variable "proxmox_api_token_id" {
  type = string
}

variable "proxmox_api_token_secret" {
  type      = string
  sensitive = true
}

variable "node" {
  type        = string
  default     = "pve1"
  description = "Name of the VM Host Node?"
}

variable "vm_id" {
  type        = string
  default     = "100"
  description = "VM ID (number) of the node."
}

variable "vm_name" {
  type        = string
  default     = "ubuntu-server-jammy"
  description = "Name of the VM Node"
}

variable "template_description" {
  type        = string
  default     = "Ubuntu Server Jammy Image"
  description = "Description of the template"
}
