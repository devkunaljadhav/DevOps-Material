#!/bin/bash
set -e

echo "🔄 Updating system..."
sudo apt update

echo "🧹 Removing old Docker versions..."
sudo apt remove -y docker docker-engine docker.io containerd runc || true

echo "📦 Installing prerequisites..."
sudo apt install -y ca-certificates curl gnupg lsb-release

echo "🔑 Adding Docker GPG key..."
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor --yes -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

echo "➕ Adding Docker repository..."
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "${VERSION_CODENAME:-$(lsb_release -cs)}") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "📥 Installing Docker Engine..."
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "🚀 Enabling and starting Docker..."
sudo systemctl enable --now docker

echo "👤 Adding current user to Docker group..."
sudo usermod -aG docker "$USER"

echo "🧪 Testing Docker installation..."
sudo docker run hello-world

echo "✅ Docker installation complete!"
echo "ℹ️ Log out and log back in, or run: newgrp docker"
