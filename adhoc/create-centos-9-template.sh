TID=$1
CUSER=$2
CPASS=$3

IMAGE=CentOS-Stream-GenericCloud-9-latest.x86_64.qcow2
TNAME=CentOS-9-Stream-Template
IMAGE_URL=https://cloud.centos.org/centos/9-stream/x86_64/images/CentOS-Stream-GenericCloud-9-latest.x86_64.qcow2
wget $IMAGE_URL

SIZE=75G
BRIDGE=vmbr0
RAM=16384
CORES=4
STORAGE=local-lvm

apt install libguestfs-tools

virt-customize -a $IMAGE --install vim,bash-completion,wget,curl,unzip,qemu-guest-agent
virt-customize -a $IMAGE --run-command 'systemctl enable qemu-guest-agent'
virt-customize -a $IMAGE --timezone "America/Los_Angeles"
virt-customize -a $IMAGE --run-command ' sed -i "s/^SELINUX=.*/SELINUX=disabled/g" /etc/selinux/config'
qemu-img resize $IMAGE $SIZE
qm create $TID --memory $RAM --cores $CORES  --net0 virtio,bridge=$BRIDGE --scsihw virtio-scsi-pci --cpu host
qm importdisk $TID $IMAGE $STORAGE
qm set $TID --scsihw virtio-scsi-pci --virtio0 local-lvm:vm-$TID-disk-0
qm set $TID --serial0 socket --vga serial0
qm set $TID --agent 1
qm set $TID --boot c --bootdisk virtio0
qm set $TID --ide2 $STORAGE:cloudinit

qm set $TID --ipconfig0 ip=dhcp --cipassword=$CPASS --ciuser=$CUSER
qm set $TID --name $TNAME
qm template $TID
