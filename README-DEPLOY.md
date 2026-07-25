# OpenHands - Deployment Guide

## Quick Start (No Python needed)

```bash
npm install -g @openhands/agent-canvas
agent-canvas
```

Then open http://localhost:3001 in your browser.

## Mobile Access

Your phone and PC need to be on the same Wi-Fi. Then:

```bash
ipconfig
```

On your phone, open: `http://YOUR_PC_IP:3001`

## Free Public Hosting Options

| Service | Free | Steps |
|---------|------|-------|
| **GitHub Codespaces** | 60h/month | Repo → Code → Codespaces → run `npm install -g @openhands/agent-canvas && agent-canvas` |
| **Render.com** | Yes | Connect GitHub repo → Web Service → free tier |
| **Koyeb** | Yes | Connect GitHub repo → one click deploy |
| **Glitch** | Yes | Import from GitHub, edit, remix |
| **Fly.io** | Yes | `fly launch` + `fly deploy` |

## For Public Access (not just localhost)

The app needs a server running 24/7. The free tiers above handle this.

### Best option for beginners: GitHub Codespaces
1. Go to your repo on GitHub
2. Click the green **Code** button → **Codespaces** → **Create**
3. In the terminal: `npm install -g @openhands/agent-canvas && agent-canvas`
4. Click " ports " tab → make port 3001 public
5. You get a public link

### Best option for free VPS: Oracle Cloud Free Tier
1. Sign up at oracle.com/cloud/free (no credit card)
2. Create a free Ubuntu VM
3. SSH into it
4. `npm install -g @openhands/agent-canvas && agent-canvas`
5. Access via your VM's public IP

## Project Structure

- `frontend/` - React frontend (built with npm)
- `openhands/` - Python backend (agent server)
- `config.toml` - Configuration file
- `workspace/` - Default project directory

## Local Development

```bash
# From the repo root
# Backend
python -m venv .venv
source .venv/bin/activate
pip install -e .

# Frontend  
cd frontend
npm install
npm run build

# Run
cd ..
python -m uvicorn openhands.app_server.app:app --host 127.0.0.1 --port 3000 --reload
npx sirv frontend/build --single --port 3001
```