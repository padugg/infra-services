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
    "rke2-master-1" = {
      node     = "prox1"
      hostname = "rke2-master-1.pad.lab"
      ip       = "10.0.10.1"
      size     = "75G"
    }

    "rke2-node-1" = {
      node     = "prox1"
      hostname = "rke2-node-1.pad.lab"
      ip       = "10.0.10.11"
      size     = "75G"
    }

    "rke2-node-2" = {
      node     = "prox2"
      hostname = "rke2-node-2.pad.lab"
      ip       = "10.0.10.12"
      size     = "75G"
    }

    "rke2-node-3" = {
      node     = "prox1"
      hostname = "rke2-node-3.pad.lab"
      ip       = "10.0.10.13"
      size     = "75G"
    }

    "rke2-node-4" = {
      node     = "prox2"
      hostname = "rke2-node-4.pad.lab"
      ip       = "10.0.10.14"
      size     = "75G"
    }

  }
}

