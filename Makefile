dns-update:
	ansible-playbook -i ./ansible/inventory.ini ./ansible/bind9.yaml
