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

variable "gateway_ip" {
  type        = string
  description = "IP Address of the Gateway of the internal Network."
}

variable "docker-server-config" {
  type = map(string)
}

variable "default_tags" {
  description = "Default tags added to resources."
  type        = map(string)
  default = {
    Maintainer  = "Sander van Dorsten"
    Environment = "production"
    Project     = "homelab"
  }
}
