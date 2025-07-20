variable "proxmox_user" {
  default = "PROXMOX_USER"
}

variable "proxmox_password" {
  default = "PROXMOX_PASSWORD"
}

variable "vms" {
  type = map(object({
    node     = string
    hostname = string
    ip       = string
    size     = string
  }))

  default = {
    "rke2-node-5" = {
      node     = "prox2"
      hostname = "rke2-node-5.pad.lab"
      ip       = "10.0.10.15"
      size     = "75G"
    }

  }
}

