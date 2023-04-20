
curl -sfL https://get.k3s.io | K3S_KUBECONFIG_MODE="644"  INSTALL_K3S_VERSION="v1.27.1-rc1+k3s1" INSTALL_K3S_EXEC="--flannel-backend=none --disable-network-policy --cluster-cidr=192.168.0.0/16" sh -
watch kubectl get pods -A -o wide
kubectl apply -f https://raw.githubusercontent.com/projectcalico/calico/v3.25.1/manifests/calico.yaml
watch kubectl get pods -A -o wide
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/jpconstantineau/kube-turing-pi/main/gitops/crd/argocd/install.yaml
kubectl apply -n argocd -f https://raw.githubusercontent.com/jpconstantineau/kube-turing-pi/main/gitops/bootstrap.yaml
watch kubectl get pods -A -o wide
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d > admin-pass.txt
cat admin-pass.txt
echo login to argocd.192-168-10-74.nip.io with the password above

sudo cat /var/lib/rancher/k3s/server/node-token

ip address
