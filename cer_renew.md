```
sudo -i
mkdir -p ~/k8s_backup/etcd
cd /etc/kubernetes/pki/
mv {apiserver.crt,apiserver-etcd-client.key,apiserver-kubelet-client.crt,front-proxy-ca.crt,front-proxy-client.crt,front-proxy-client.key,front-proxy-ca.key,apiserver-kubelet-client.key,apiserver.key,apiserver-etcd-client.crt} ~/k8s_backup
cd /etc/kubernetes/pki/etcd
mv {healthcheck-client.crt,healthcheck-client.key,peer.crt,peer.key,server.crt,server.key} ~/k8s_backup/etcd/
kubeadm init phase certs all

cd /etc/kubernetes
mv {admin.conf,controller-manager.conf,kubelet.conf,scheduler.conf} ~/k8s_backup
kubeadm init phase kubeconfig all


kubeadm alpha certs check-expiration

```
