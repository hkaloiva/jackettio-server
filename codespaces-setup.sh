#!/bin/bash

echo "🚀 Setting up Jackettio in GitHub Codespaces..."

# Wait for Docker to be ready
echo "⏳ Waiting for Docker to be ready..."
while ! docker info > /dev/null 2>&1; do
    sleep 2
done

echo "✅ Docker is ready!"

# Run the standard installation with local setup
echo "🔧 Installing Jackettio..."

# Create local configuration (no domain needed in Codespaces)
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

# Install Jackettio
chmod +x ./cli.sh
./cli.sh install

# Install MediaFlow
echo "📡 Installing MediaFlow Proxy..."
sleep 5  # Wait for other services to be ready

docker run -d --name mediaflow --restart unless-stopped \
  -p 8686:8888 \
  -e API_PASSWORD=p7vCEWPIIux4lCmypQsZ3krisjzX4lnwlKZ9lPbXakc \
  mhdzumair/mediaflow-proxy

echo ""
echo "✅ Setup complete!"
echo ""
echo "🌐 Your services are available at:"
echo "   - Jackettio: https://your-codespace-url-4000.app.github.dev/configure"
echo "   - Jackett: https://your-codespace-url-9117.app.github.dev"
echo "   - MediaFlow: https://your-codespace-url-8686.app.github.dev"
echo ""
echo "📝 Codespaces automatically forwards these ports with HTTPS!"
echo "📱 Use the Jackettio URL in Stremio addon installation"