# 24/7 Support Roster Application

A dynamic, containerized shift roster scheduler for managing 24/7 support coverage across multiple time zones (India, Morocco, Panama).

## 🚀 Features

- **Dynamic Shift Scheduling** - Visual calendar-based roster system
- **Multi-timezone Support** - Color-coded regions (India, Morocco, Panama)
- **Docker Containerized** - Run anywhere with Docker
- **Responsive Design** - Works on desktop and tablet devices
- **Modern UI** - Dark theme with accent colors and smooth animations
- **Auto-save** - Status indicator for save operations
- **Weekend Highlighting** - Easy distinction between weekdays and weekends

## 📋 Project Files

- **V5_roster_dynamic.html** - Latest roster version (production)
- **V4_roster_dynamic.html** - Previous iteration
- **V3_roster_dynamic.html** - Earlier version
- **roster_v2.html** - Initial version

## 🐳 Docker Setup

### Prerequisites
- Docker Desktop installed ([Download](https://www.docker.com/products/docker-desktop))

### Quick Start (Windows)

Simply double-click:
```bash
start.bat          # Start the container
open.bat           # Start & open in browser
stop.bat           # Stop the container
rebuild.bat        # Rebuild from scratch
logs.bat           # View logs
menu.bat           # Interactive menu
```

### Or use docker-compose
```bash
docker-compose up --build -d
```

### Access the Application
```
http://localhost:8080
```

## 📝 Available Scripts

- **start.bat** - Build and start Docker container
- **stop.bat** - Stop the running container
- **logs.bat** - View live container logs
- **rebuild.bat** - Clean rebuild from scratch
- **open.bat** - Open app in browser (auto-starts if needed)
- **menu.bat** - Interactive Docker management menu
- **quickfix.bat** - Quick fix for common issues

## 🛠️ Technology Stack

- **Frontend**: HTML5, CSS3, JavaScript (Vanilla)
- **Server**: Nginx (Alpine Linux)
- **Container**: Docker & Docker Compose
- **Fonts**: Google Fonts (Space Mono, Sora)

## 🎨 Design

- **Dark Theme** - Easy on the eyes for 24/7 operations
- **Color Coding**:
  - 🟠 **Orange** - India Region
  - 🟢 **Green** - Morocco Region
  - 🟣 **Purple** - Panama Region
- **Responsive Grid** - Auto-adjusts to different screen sizes

## 📦 Configuration

### Change Port
Edit `docker-compose.yml`:
```yaml
ports:
  - "3000:80"  # Change 3000 to your desired port
```

### Customize Nginx
Edit `nginx.conf` for advanced web server configuration

## 🔍 Troubleshooting

**Port 8080 already in use:**
- Change port in `docker-compose.yml`

**Container won't start:**
```bash
docker logs shift-roster-app
```

**Rebuild everything:**
```bash
docker-compose down --rmi all
docker-compose up --build
```

## 📄 License

MIT License - Feel free to use and modify

## 👨‍💻 Development

To make changes:
1. Edit `.html` files
2. Changes auto-reflect due to volume mounts
3. Rebuild with `rebuild.bat` if needed

## 🐛 Known Issues

None currently reported

## 🚀 Future Enhancements

- [ ] Backend API for persistent data storage
- [ ] User authentication
- [ ] Export/Import functionality
- [ ] Advanced filtering and search
- [ ] Mobile app version

## 📞 Support

For issues or questions, check the logs:
```bash
docker logs shift-roster-app
```

---

**Version**: 5.0 (Latest)  
**Last Updated**: 2026-04-29  
**Status**: Production Ready ✅
