
#!/bin/bash
# Sample Soanrqube
exec > /var/log/user-data.log 2>&1
set -xe

# Install Docker
sudo apt update && sudo apt -y install docker.io

 #Install kubectl

sudo curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.23.7/bin/linux/amd64/kubectl && sudo chmod +x ./kubectl && sudo mv ./kubectl /usr/local/bin/kubectl

# Install Minikube
sudo curl -Lo minikube https://storage.googleapis.com/minikube/releases/v1.23.2/minikube-linux-amd64 && sudo chmod +x minikube && sudo mv minikube /usr/local/bin/

 # Start Minikube
sudo apt install conntrack
sudo minikube start --vm-driver=none

#  Install kubectl

sudo kubectl create namespace argocd
sudo kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
sudo kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "NodePort"}}' 



