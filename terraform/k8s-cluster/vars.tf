locals { 
  nodes = [
    {
        name = "rke2-master-1.pad.lab"
        ip   = "10.0.10.1"
        node = "prox1"
        size = "75G"
    },
    {
        name = "rke2-master-2.pad.lab"
        ip   = "10.0.10.2"
        node = "prox2"
        size = "75G"
    },
    {
        name = "rke2-master-3.pad.lab"
        ip   = "10.0.10.3"
        node = "prox2"
        size = "75G"
    },
    {
        name = "rke2-node-1.pad.lab"
        ip   = "10.0.10.11"
        node = "prox1"
        size = "75G"
    },
    {
        name = "rke2-node-2.pad.lab"
        ip   = "10.0.10.12"
        node = "prox2"
        size = "75G"
    },
    {
        name = "rke2-node-3.pad.lab"
        ip   = "10.0.10.13"
        node = "prox1"
        size = "75G"
    },
    {
        name = "rke2-node-4.pad.lab"
        ip   = "10.0.10.14"
        node = "prox2"
        size = "75G"
    },
    {
        name = "rke2-node-5.pad.lab"
        ip   = "10.0.10.15"
        node = "prox1"
        size = "75G"
    },
  ]

  nodes_map = {
    for node in local.nodes : node.name => node
  }
}
