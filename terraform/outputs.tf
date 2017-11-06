output "bootstrap_ssh_command" {
  value = "ssh -i ssh/cluster.pem root@${digitalocean_droplet.bootstrap_node.ipv4_address}"
}

output "master_node_ip" {
  value = "${digitalocean_droplet.master_nodes.ipv4_address}"
}

output "worker_node_ip" {
  value = "${digitalocean_droplet.worker_nodes.ipv4_address}"
}

output "ingress_node_ip" {
  value = "${digitalocean_droplet.ingress_nodes.ipv4_address}"
}

output "kubernetes_dashboard_url" {
  value = "https://${digitalocean_droplet.master_nodes.ipv4_address}:6443/ui"
}