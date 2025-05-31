resource "proxmox_vm_qemu" "cloudinit" {
  for_each = local.nodes_map
  name    =   each.key
  target_node = "prox1"
  cores = 4
  memory  = 16384
  agent   = 1
  ciupgrade = true
  onboot = true
  searchdomain = "pad.lab"
  nameserver = "10.10.10.10"
  sshkeys = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIMs3Kk0kKg/0kxFAZis8X4/0F5NcXyba7lQLXg+u4al"
  scsihw  = "virtio-scsi-pci"
  clone = "CentOS-9-Stream-Template"
  full_clone = false
  pool = "Core"
  ipconfig0 = replace("ip=$IP/8,gw=10.0.0.1", "$IP", each.value.ip)
  bootdisk = "virtio0"
  network {
    id    = 0
    model = "virtio"
    bridge = "vmbr0"
  }
  serial {
    id   = 0
    type = "socket"
  }
  disks {
    virtio {
      virtio0 {
        disk {
          storage      = "local-lvm"
          size         = "75G"
          backup       = false
        }
      }
    }
    ide {
      ide0 {
        cloudinit {
          storage        = "local-lvm"
        }
      }
    }
  }
}
