locals { 
  nodes = [
    {
        name = "rke2-master.pad.lab"
        ip   = "10.0.10.1"
    },
    {
        name = "rke2-node-1.pad.lab"
        ip   = "10.0.10.2"
    },
    {
        name = "rke2-node-2.pad.lab"
        ip   = "10.0.10.3"
    },
    {
        name = "rke2-node-3.pad.lab"
        ip   = "10.0.10.4"
    },
  ]

  nodes_map = {
    for node in local.nodes : node.name => node
  }
}
