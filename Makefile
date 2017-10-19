KISMATIC_VERSION=1.6.0

ssh-keypair:
	mkdir ssh
	cd ssh && ssh-keygen -t rsa -f cluster.pem -N ""
	chmod 600 ssh/cluster.pem

cluster:
	cd terraform && terraform init && terraform apply

get-dependencies:
	wget --no-check-certificate -O - https://github.com/apprenda/kismatic/releases/download/v$(KISMATIC_VERSION)/kismatic-v$(KISMATIC_VERSION)-linux-amd64.tar.gz | tar -zx
	cp helm /usr/local/bin/helm
	cp kubectl /usr/local/bin/kubectl

provision-cluster:
	chmod 600 cluster.pem
	./kismatic install apply -f kismatic-cluster.yaml
	cp generated/kubeconfig .
	mkdir ~/.kube/
	cp kubeconfig ~/.kube/config