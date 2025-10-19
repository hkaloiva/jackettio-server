# 🆓 Free Hosting Options for Jackettio

## Option 1: Railway.app (Recommended - $0/month)

### Benefits:
- ✅ **Truly free** with $5 monthly credit
- ✅ **24/7 uptime** (no sleeping)
- ✅ **Free subdomains** (yourapp.railway.app)
- ✅ **Easy deployment** from GitHub
- ✅ **No credit card required**

### Setup Steps:

1. **Create GitHub Repository**
   ```bash
   # Create a new repo on GitHub, then:
   git init
   git add .
   git commit -m "Initial Jackettio setup"
   git remote add origin https://github.com/yourusername/jackettio.git
   git push -u origin main
   ```

2. **Deploy on Railway**
   - Go to [railway.app](https://railway.app)
   - Sign up with GitHub
   - Click "Deploy from GitHub repo"
   - Select your jackettio repository
   - Railway will auto-deploy!

3. **Configure Environment Variables**
   In Railway dashboard, add these variables:
   ```
   JACKETT_URL=http://jackett:9117
   JACKETT_API_KEY=wj6y25qxlszh9wlzmbci1m3k4ha71wfp
   MEDIAFLOW_PASSWORD=p7vCEWPIIux4lCmypQsZ3krisjzX4lnwlKZ9lPbXakc
   ```

---

## Option 2: Render.com (Free with limitations)

### Benefits:
- ✅ **Completely free**
- ⚠️ **Sleeps after 15min** inactivity
- ⚠️ **750 hours/month** limit

### Good for:
- Testing purposes
- Personal use only
- Occasional streaming

---

## Option 3: Oracle Cloud Always Free

### Benefits:
- ✅ **Most powerful** (4 cores, 24GB RAM)
- ✅ **Always free** tier
- ✅ **No time limits**
- ⚠️ **Requires credit card** (never charged)

### Setup:
1. Sign up at [cloud.oracle.com](https://cloud.oracle.com)
2. Create "Always Free" account
3. Launch Ubuntu VM
4. Use our VPS deployment script

---

## Option 4: Replit (Simplest)

### Benefits:
- ✅ **No setup required**
- ✅ **Web-based IDE**
- ⚠️ **Public by default**
- ⚠️ **Limited resources**

### Setup:
1. Go to [replit.com](https://replit.com)
2. Create new Bash repl
3. Upload and run deployment script

---

## Recommended: Railway.app

Railway is the best free option because:
- **No sleeping** - Always available
- **$5 monthly credit** covers hosting costs
- **Easy deployment** - Just push to GitHub
- **Free subdomain** - No domain costs
- **Good performance** - Suitable for streaming

Would you like me to help you set up Railway deployment?