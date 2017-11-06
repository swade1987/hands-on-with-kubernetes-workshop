KISMATIC_VERSION=1.6.0

ssh-keypair:
	mkdir ssh
	cd ssh && ssh-keygen -t rsa -f cluster.pem -N ""
	chmod 600 ssh/cluster.pem

cluster:
	cd terraform && terraform init && terraform apply

provision-cluster:
	chmod 600 cluster.pem
	kismatic install apply -f kismatic-cluster.yaml
	cp generated/kubeconfig .
	mkdir ~/.kube/
	cp kubeconfig ~/.kube/config

destroy-cluster:
	cd terraform && terraform init && terraform destroy --force
	rm -rf ssh