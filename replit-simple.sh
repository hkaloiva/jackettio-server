#!/bin/bash

echo "🚀 Setting up Jackettio on Replit (Simple Version)..."

# Install Node.js and npm if not available
if ! command -v node &> /dev/null; then
    echo "📦 Installing Node.js..."
    curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
    sudo apt-get install -y nodejs
fi

# Install git if not available
if ! command -v git &> /dev/null; then
    echo "📦 Installing git..."
    sudo apt-get update && sudo apt-get install -y git
fi

# Clone and setup Jackettio directly
echo "📥 Cloning Jackettio..."
git clone https://github.com/arvida42/jackettio.git jackettio-app
cd jackettio-app

# Install dependencies
echo "📦 Installing dependencies..."
npm install

# Create configuration
echo "⚙️ Creating configuration..."
cat > .env << EOF
JACKETT_URL=http://localhost:9117
JACKETT_API_KEY=wj6y25qxlszh9wlzmbci1m3k4ha71wfp
PORT=3000
NODE_ENV=production
EOF

echo "✅ Setup complete!"
echo ""
echo "🚀 To start Jackettio, run:"
echo "cd jackettio-app && npm start"
echo ""
echo "🌐 Your Jackettio will be available on Replit's provided URL"
echo "📝 You'll still need to set up Jackett and MediaFlow separately"