#!/bin/bash

# Jackettio VPS Deployment Script
# Run this on your VPS after setting up Docker

set -e

echo "🚀 Deploying Jackettio to VPS..."

# Create directory
mkdir -p ~/jackettio && cd ~/jackettio

# Download Jackettio CLI
curl -fsSL https://raw.githubusercontent.com/arvida42/jackettio/master/cli.sh -o cli.sh
chmod +x ./cli.sh

# Create environment file for Traefik (with domain)
cat > .env.production << EOF
ACME_DOMAIN=YOUR_DOMAIN_HERE
ACME_EMAIL=YOUR_EMAIL_HERE
INSTALL_TYPE=1
LOCALTUNNEL=false
JACKETT_URL=http://jackett:9117
JACKETT_API_KEY=wj6y25qxlszh9wlzmbci1m3k4ha71wfp
PORT=4000
COMPOSE_FILE=docker-compose.yml
EOF

echo "⚠️  Please edit .env.production and set your domain and email"
echo "📝 Then run: ./cli.sh install"
echo ""
echo "🔧 After installation, install MediaFlow:"
echo "docker run -d --name mediaflow --restart unless-stopped \\"
echo "  -p 8686:8888 \\"
echo "  -e API_PASSWORD=p7vCEWPIIux4lCmypQsZ3krisjzX4lnwlKZ9lPbXakc \\"
echo "  mhdzumair/mediaflow-proxy"
echo ""
echo "✅ Don't forget to configure Jackett with your zelka.org credentials"