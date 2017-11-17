# Upload SSH key which all instances will use.
resource "digitalocean_ssh_key" "default" {
  public_key = "${file("${path.module}/../ssh/cluster.pem.pub")}"
  name       = "${var.unique_identifier}"
}

# Create a new tag
resource "digitalocean_tag" "cluster_tag" {
  name = "${var.unique_identifier}"
}

# Interpolate the generated values into the kismatic-cluster.yaml
data "template_file" "kismatic_cluster" {
  template = "${file("${path.module}/user-data/kismatic-cluster.yaml.tpl")}"

  vars {
    etcd_ip = "${digitalocean_droplet.etcd_nodes.0.ipv4_address}"
    master_ip = "${digitalocean_droplet.master_nodes.0.ipv4_address}"
    worker_ip = "${digitalocean_droplet.worker_nodes.0.ipv4_address}"
    ingress_ip = "${digitalocean_droplet.ingress_nodes.0.ipv4_address}"
  }
}