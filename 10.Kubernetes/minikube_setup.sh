sudo apt update -y
sudo apt upgrade -y
sudo apt install curl wget apt-transport-https ca-certificates -y
# Install Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
# Install Minikube
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
sudo chmod +x /usr/local/bin/minikube
# Check Minikube version
minikube version
# Download kubectl
KUBECTL_VERSION=$(curl -L -s https://dl.k8s.io/release/stable.txt)
curl -LO "https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl"
curl -LO "https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl.sha256"
# Verify kubectl checksum
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
# Install kubectl
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
# Check kubectl version
kubectl version --client

# Start Minikube
sudo minikube start --driver=docker --force
# Verify cluster
sudo minikube status
sudo kubectl get nodes
sudo kubectl get pods -A
