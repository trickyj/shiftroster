# Shift Roster - Docker Setup

## What's Been Created

I've created all the necessary Docker files to containerize your shift roster application:

### Files Created:
- **Dockerfile** - Defines the Docker image using nginx:alpine
- **docker-compose.yml** - Orchestration file for easy container management
- **nginx.conf** - Nginx configuration for serving static files
- **.dockerignore** - Files to exclude from Docker build

## Quick Start

### Prerequisites
- Docker Desktop installed (https://www.docker.com/products/docker-desktop)
- Command line access (PowerShell, CMD, or bash)

### Run the Application

**Option 1: Using docker-compose (Recommended)**
```bash
cd d:\programming\2026_Projects\shift_roster
docker-compose up --build -d
```

**Option 2: Using Docker directly**
```bash
cd d:\programming\2026_Projects\shift_roster
docker build -t shift-roster:latest .
docker run -d -p 8080:80 --name shift-roster-app shift-roster:latest
```

### Access the Application
Once running, open your browser and navigate to:
- **http://localhost:8080**

### Useful Commands

**View running containers:**
```bash
docker ps
```

**View container logs:**
```bash
docker logs shift-roster-app
```

**Stop the container:**
```bash
docker-compose down
# or
docker stop shift-roster-app
```

**Rebuild after code changes:**
```bash
docker-compose up --build
```

**Remove container and image:**
```bash
docker-compose down --rmi all
```

## Configuration

### Port
- **Default**: 8080 (host) → 80 (container)
- **To change**: Edit `docker-compose.yml` ports section (e.g., "3000:80")

### Volumes
The docker-compose.yml mounts HTML files for live editing:
- Changes to `.html` files are reflected instantly without rebuilding

### Health Check
The container includes a health check that verifies the service is running correctly.

## Architecture

- **Base Image**: nginx:alpine (lightweight, ~40MB)
- **Port Mapping**: 8080:80
- **Restart Policy**: unless-stopped (auto-restart on failure)
- **Default Route**: V5_roster_dynamic.html (latest version)

## Performance Notes

- Nginx is optimized for serving static files
- CSS/JS assets are cached for 30 days
- HTML files bypass cache to allow live updates
- Alpine Linux reduces image size significantly

## Troubleshooting

**Port 8080 already in use:**
```bash
# Change port in docker-compose.yml from 8080:80 to another port like 3000:80
```

**Container won't start:**
```bash
docker logs shift-roster-app
```

**Rebuild everything from scratch:**
```bash
docker-compose down --rmi all
docker-compose up --build
```

## Next Steps

Your shift roster is now ready to be containerized! Run the commands above to get started.
