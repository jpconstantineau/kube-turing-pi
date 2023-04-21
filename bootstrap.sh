
curl -sfL https://get.k3s.io | K3S_KUBECONFIG_MODE="644"  INSTALL_K3S_VERSION="v1.27.1-rc1+k3s1" INSTALL_K3S_EXEC="--flannel-backend=none --disable-network-policy --cluster-cidr=192.168.0.0/16 --disable=traefik --disable=local-storage" sh -
export KUBECONFIG=/etc/rancher/k3s/k3s.yaml
kubectl get nodes -A -o wide
kubectl apply -f gitops/crd/kube-system/calico.yaml
kubectl get nodes -A -o wide
kubectl wait --for=condition=ready node -l kubernetes.io/hostname=turing-4
kubectl get pods -A -o wide
kubectl create namespace argocd
kubectl apply -n argocd -f gitops/crd/argocd/install.yaml
kubectl apply -n argocd -f gitops/bootstrap.yaml
kubectl get pods -A -o wide
kubectl wait -n argocd --for=condition=ready pod -l app.kubernetes.io/name=argocd-server
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d > admin-pass.txt
cat admin-pass.txt
echo login to argocd.192-168-10-74.nip.io with the password above

sudo cat /var/lib/rancher/k3s/server/node-token

ip address
