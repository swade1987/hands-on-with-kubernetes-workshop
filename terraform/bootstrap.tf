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
      "wget https://github.com/apprenda/kismatic/releases/download/${var.kismatic_version}/kismatic-${var.kismatic_version}-linux-amd64.tar.gz",
      "tar xvf kismatic-${var.kismatic_version}-linux-amd64.tar.gz",
      "cp helm /usr/local/bin/helm",
      "cp kubectl /usr/local/bin/kubectl",
      "echo 'source <(kubectl completion bash)' >> ~/.bashrc",
      "cp kismatic /usr/local/bin/kismatic",
      "rm kismatic-${var.kismatic_version}-linux-amd64.tar.gz"
    ]
  }
}