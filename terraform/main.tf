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

# Create the bootstrap node
resource "digitalocean_droplet" "bootstrap_node" {
  image              = "${var.image}"
  name               = "bootstrap-node"
  region             = "${var.region}"
  size               = "${var.droplet_size}"
  ssh_keys           = ["${digitalocean_ssh_key.default.id}"]
  private_networking = true
  tags               = ["${digitalocean_tag.cluster_tag.id}"]

  connection {
    type        = "ssh"
    private_key = "${file("${path.module}/../ssh/cluster.pem")}"
    user        = "root"
    timeout     = "2m"
  }

  # ########################################################
  # Upload all the files and directories required.
  # ########################################################

  # Upload the SSH key required to interact with the cluster.
  provisioner "file" {
    source      = "${path.module}/../ssh/cluster.pem"
    destination = "/root/cluster.pem"
  }

  # Upload the Makefile to allow for a nice abstraction.
  provisioner "file" {
    source      = "${path.module}/../Makefile"
    destination = "/root/Makefile"
  }

  # Upload all the examples.
  provisioner "file" {
    source      = "${path.module}/../examples"
    destination = "/root"
  }

  # Upload the kismatic-cluster.yaml
  provisioner "file" {
    content = "${data.template_file.kismatic_cluster.rendered}"
    destination = "/root/kismatic-cluster.yaml"
  }

  # Upload the bootstrap provisioning script
  provisioner "file" {
    source      = "${path.module}/user-data/bootstrap-provisioning-script.sh"
    destination = "/root/bootstrap-provisioning-script.sh"
  }

  # Upload the kismatic tar file.
  provisioner "file" {
    source      = "${path.module}/user-data/${var.kismatic_tar_file}"
    destination = "/root/${var.kismatic_tar_file}"
  }

  # ########################################################
  # Execute the necessary commands to setup the cluster.
  # ########################################################

  provisioner "remote-exec" {
    inline = [
      "chmod +x /root/bootstrap-provisioning-script.sh",
      "/root/bootstrap-provisioning-script.sh args",
    ]
  }

  # Extract the Kismatic tar file and setup both Kubectl and Helm
  provisioner "remote-exec" {
    inline = [
      "tar -xvzf ${var.kismatic_tar_file}",
      "cp helm /usr/local/bin/helm",
      "cp kubectl /usr/local/bin/kubectl",
      "echo 'source <(kubectl completion bash)' >> ~/.bashrc",
      "cp kismatic /usr/local/bin/kismatic",
      "rm ${var.kismatic_tar_file}"
    ]
  }
}

# Create the Kubernetes master nodes (e.g. master1)
resource "digitalocean_droplet" "master_nodes" {
  count              = "${var.master_count}"
  image              = "${var.image}"
  name               = "${format("master%1d", count.index + 1)}"
  region             = "${var.region}"
  size               = "${var.droplet_size}"
  ssh_keys           = ["${digitalocean_ssh_key.default.id}"]
  tags               = ["${digitalocean_tag.cluster_tag.id}"]
  private_networking = true
}

# Create the Kubernetes Etcd nodes (e.g. etcd1)
resource "digitalocean_droplet" "etcd_nodes" {
  count              = "${var.etcd_count}"
  image              = "${var.image}"
  name               = "${format("etcd%1d", count.index + 1)}"
  region             = "${var.region}"
  size               = "${var.droplet_size}"
  ssh_keys           = ["${digitalocean_ssh_key.default.id}"]
  tags               = ["${digitalocean_tag.cluster_tag.id}"]
  private_networking = true
}

# Create the Kubernetes worker nodes (e.g. worker1)
resource "digitalocean_droplet" "worker_nodes" {
  count              = "${var.worker_count}"
  image              = "${var.image}"
  name               = "${format("worker%1d", count.index + 1)}"
  region             = "${var.region}"
  size               = "${var.droplet_size}"
  ssh_keys           = ["${digitalocean_ssh_key.default.id}"]
  tags               = ["${digitalocean_tag.cluster_tag.id}"]
  private_networking = true
}

# Create the Kubernetes ingress nodes (e.g. ingress1)
resource "digitalocean_droplet" "ingress_nodes" {
  count              = "${var.ingress_count}"
  image              = "${var.image}"
  name               = "${format("ingress%1d", count.index + 1)}"
  region             = "${var.region}"
  size               = "${var.droplet_size}"
  ssh_keys           = ["${digitalocean_ssh_key.default.id}"]
  tags               = ["${digitalocean_tag.cluster_tag.id}"]
  private_networking = true
}
