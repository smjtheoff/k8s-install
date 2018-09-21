iptables-save > /tmp/iptables.conf
apt-get update && apt-get upgrade -y
apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common


curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
apt-key fingerprint 0EBFCD88

add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

apt-get update
apt-get -y install docker-ce 
apt-get -y install nfs-kernel-server
apt-get -y install nfs-common
groupadd docker
usermod -aG docker $USER
systemctl enable docker

apt-get update && apt-get install -y apt-transport-https curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
bash -c 'echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" > /etc/apt/sources.list.d/kubernetes.list'
apt-get update
apt-get install -y kubelet=1.11.1-00 kubeadm=1.11.1-00 kubectl
iptables-restore < /tmp/iptables.conf