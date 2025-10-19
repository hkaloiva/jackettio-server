# 🚀 Jackettio VPS Deployment Guide

## 1. Choose and Setup VPS

### Recommended Providers:
- **Hetzner Cloud** (€3-5/month) - Best value
- **DigitalOcean** ($6/month) - Beginner-friendly
- **Vultr** ($6/month) - Fast deployment

### Required Specs:
- **RAM**: 2GB minimum (4GB preferred)
- **CPU**: 1-2 cores
- **Storage**: 20GB SSD
- **OS**: Ubuntu 22.04 LTS

## 2. Domain Setup (Required for HTTPS)

You need a domain pointing to your VPS IP. Options:
- **Free**: Get a subdomain from No-IP, DuckDNS, or FreeDNS
- **Paid**: Buy from Namecheap, Cloudflare, etc.

Set up an **A record** pointing your domain to your VPS IP.

## 3. VPS Initial Setup

SSH into your VPS and run:

```bash
# Update system
sudo apt update && sudo apt upgrade -y

# Install Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker $USER

# Logout and login again, then test
docker --version
```

## 4. Deploy Jackettio

Upload and run the deployment script:

```bash
# Upload vps-deploy.sh to your VPS, then:
chmod +x vps-deploy.sh
./vps-deploy.sh

# Edit the configuration
nano .env.production
# Set YOUR_DOMAIN_HERE to your actual domain
# Set YOUR_EMAIL_HERE to your email for SSL

# Install
./cli.sh install
```

## 5. Install MediaFlow

```bash
docker run -d --name mediaflow --restart unless-stopped \
  -p 8686:8888 \
  -e API_PASSWORD=p7vCEWPIIux4lCmypQsZ3krisjzX4lnwlKZ9lPbXakc \
  mhdzumair/mediaflow-proxy
```

## 6. Configure Services

1. **Jackett**: Go to `https://yourdomain.com:9117`
   - Login with password: `UezTzXLe9JYC1hVX` (change it!)
   - Add zelka.org indexer

2. **Jackettio**: Go to `https://yourdomain.com/configure`
   - Enable MediaFlow Proxy
   - URL: `http://localhost:8686`
   - Password: `p7vCEWPIIux4lCmypQsZ3krisjzX4lnwlKZ9lPbXakc`
   - Add your Debrid service

## 7. Update Stremio

Remove old addon and install new one with URL: `https://yourdomain.com`

## Important Notes:

- **Firewall**: Ensure ports 80, 443, 9117, and 8686 are open
- **Security**: Change default passwords immediately
- **Backups**: Consider backing up your configuration
- **Monitoring**: Check container status with `docker ps`

## Troubleshooting:

```bash
# Check all containers
docker ps -a

# View logs
docker logs jackettio
docker logs jackett
docker logs mediaflow

# Restart if needed
./cli.sh restart
```

Your setup will be available at `https://yourdomain.com` with automatic SSL!