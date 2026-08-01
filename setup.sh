#!/bin/bash
set -e

echo "=========================================================="
echo "🚀 Starting Automated Keycloak Production Server Setup"
echo "=========================================================="

# 1. Update system packages
echo "📦 Updating system packages..."
sudo apt update && sudo apt upgrade -y

# 2. Install Docker, Docker Compose, Git, and UFW
echo "🐳 Installing Docker & Dependencies..."
sudo apt install -y docker.io docker-compose-v2 git ufw curl

# 3. Enable Docker service
sudo systemctl enable --now docker

# 4. Configure Firewall (UFW)
echo "🔒 Configuring Firewall..."
sudo ufw allow 22/tcp
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw allow 8080/tcp
sudo ufw --force enable

# 5. Fix Oracle Cloud / Ubuntu iptables if present
echo "⚙️ Configuring Network Rules..."
sudo iptables -F || true
sudo iptables -I INPUT 6 -m state --state NEW -p tcp --dport 80 -j ACCEPT || true
sudo iptables -I INPUT 6 -m state --state NEW -p tcp --dport 443 -j ACCEPT || true
sudo iptables -I INPUT 6 -m state --state NEW -p tcp --dport 8080 -j ACCEPT || true

# 6. Create Production .env File if not exists
if [ ! -f .env ]; then
    echo "📝 Creating production .env file..."
    read -p "Enter your Domain Name (e.g. trader-news.co.in): " DOMAIN_INPUT
    read -p "Enter your Email Address for SSL (e.g. ashirraju@gmail.com): " EMAIL_INPUT
    read -p "Enter Keycloak Admin Username [default: admin]: " ADMIN_USER
    read -sp "Enter Keycloak Admin Password [default: SecureAdminPass123!]: " ADMIN_PASS
    echo ""

    ADMIN_USER=${ADMIN_USER:-admin}
    ADMIN_PASS=${ADMIN_PASS:-SecureAdminPass123!}
    DOMAIN_INPUT=${DOMAIN_INPUT:-trader-news.co.in}
    EMAIL_INPUT=${EMAIL_INPUT:-ashirraju@gmail.com}

    cat << EOF > .env
DOMAIN_NAME=${DOMAIN_INPUT}
KC_HOSTNAME=https://${DOMAIN_INPUT}
SSL_EMAIL=${EMAIL_INPUT}

KC_DB_DATABASE=keycloak
KC_DB_USERNAME=keycloak_user
KC_DB_PASSWORD=SecurePostgresPassword123!

KEYCLOAK_ADMIN=${ADMIN_USER}
KEYCLOAK_ADMIN_PASSWORD=${ADMIN_PASS}
EOF
    echo "✅ .env file created successfully."
fi

# Add current user to docker group
sudo usermod -aG docker $USER || true

# 7. Build and Start Production Docker Containers
echo "🚀 Building and launching Keycloak + Traefik + Postgres..."
sudo docker compose -f docker-compose.traefik.yml up -d --build

echo "=========================================================="
echo "🎉 Setup Complete! Keycloak is booting up."
echo "=========================================================="
echo "Follow live logs with: docker compose -f docker-compose.traefik.yml logs -f keycloak"
