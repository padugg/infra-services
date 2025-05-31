terraform {
  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
      version = "3.0.1-rc9"
    }
  }
}

provider "proxmox" {
    pm_api_url = "https://prox1.pad.lab:8006/api2/json"
    pm_tls_insecure = true
}
