terraform {

  required_version = ">= 0.13.0"

  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "2.9.3"
    }
  }
}

provider "proxmox" {

  pm_api_url          = var.proxmox_api_url
  pm_api_token_id     = var.proxmox_api_token_id
  pm_api_token_secret = var.proxmox_api_token_secret

  # Skip TLS Verification because of the untrusted self-signed certificate
  pm_tls_insecure = true

  pm_log_enable = true
  pm_log_file   = "logs/proxmox_run_${timestamp()}.log"
  pm_debug      = true
  pm_log_levels = {
    _default    = "debug"
    _capturelog = ""
  }
}