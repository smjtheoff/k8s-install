### install K8S Single Node

1. Install kubeadm (k8s_Lasted.sh)
	
2. Kube INIT

	sudo su -
	
	swapoff -a
	
	kubeadm init --kubernetes-version=v1.9.2  --apiserver-advertise-address=0.0.0.0 --pod-network-cidr=10.244.0.0/16 
	
	exit

3. ADD Kube Config

    mkdir -p $HOME/.kube
    
    sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
    
    sudo chown $(id -u):$(id -g) $HOME/.kube/config

4. Make Master node to handle POD

	kubectl taint nodes --all node-role.kubernetes.io/master-


5. INSTALL SDN

    kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
    
    kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/v0.8.0/Documentation/kube-flannel-rbac.yml
	
6. Install dashboard,heapster server by command:

    kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/master/src/deploy/recommended/kubernetes-dashboard.yaml

    kubectl apply -f https://github.com/kubernetes/heapster/raw/master/deploy/kube-config/rbac/heapster-rbac.yaml

    kubectl apply -f https://github.com/kubernetes/heapster/raw/master/deploy/kube-config/influxdb/heapster.yaml

    kubectl apply -f https://raw.githubusercontent.com/kubernetes/heapster/master/deploy/kube-config/influxdb/influxdb.yaml



