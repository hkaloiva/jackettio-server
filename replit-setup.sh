#!/bin/bash

# Replit Jackettio Setup Script
echo "🚀 Setting up Jackettio on Replit..."

# Install Docker (if not already installed)
if ! command -v docker &> /dev/null; then
    echo "📦 Installing Docker..."
    curl -fsSL https://get.docker.com | sh
    sudo usermod -aG docker $USER
fi

# Check if Docker is running and start if needed
if ! pgrep -x "dockerd" > /dev/null; then
    echo "🐳 Starting Docker daemon..."
    sudo dockerd > /dev/null 2>&1 &
    sleep 10
fi

# Run the standard Jackettio installation
echo "🔧 Running Jackettio installation..."
chmod +x ./cli.sh

# Create a Replit-friendly environment file
cat > .env.production << EOF
ACME_DOMAIN=
ACME_EMAIL=
INSTALL_TYPE=3
LOCALTUNNEL=false
JACKETT_URL=http://jackett:9117
JACKETT_API_KEY=wj6y25qxlszh9wlzmbci1m3k4ha71wfp
PORT=4000
COMPOSE_FILE=docker-compose.yml
EOF

# Install with local setup (no domain needed)
echo "⚙️ Installing Jackettio..."
./cli.sh install

# Install MediaFlow
echo "📡 Installing MediaFlow Proxy..."
docker run -d --name mediaflow --restart unless-stopped \
  -p 8686:8888 \
  -e API_PASSWORD=p7vCEWPIIux4lCmypQsZ3krisjzX4lnwlKZ9lPbXakc \
  mhdzumair/mediaflow-proxy

echo "✅ Setup complete!"
echo ""
echo "🌐 Your services will be available at:"
echo "   - Jackettio: http://localhost:4000/configure"
echo "   - Jackett: http://localhost:9117"
echo "   - MediaFlow: http://localhost:8686"
echo ""
echo "📝 Next steps:"
echo "1. Configure Jackett with your zelka.org credentials"
echo "2. Configure MediaFlow in Jackettio settings"
echo "3. Use the Replit URL in Stremio"