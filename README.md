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

## 📁 Project Structure

```
shift-roster/
├── V5_roster_dynamic.html    # Current production version
├── Dockerfile                 # Docker image definition
├── docker-compose.yml         # Docker Compose configuration
├── nginx.conf                 # Nginx web server config
├── README.md                  # This file
├── LICENSE.txt                # MIT License
├── CHANGELOG.md               # Version history
│
├── scripts/                   # Management & deployment scripts
│   ├── start.bat              # Start Docker container
│   ├── stop.bat               # Stop Docker container
│   ├── open.bat               # Open in browser
│   ├── logs.bat               # View container logs
│   ├── rebuild.bat            # Rebuild from scratch
│   ├── menu.bat               # Interactive menu
│   ├── git-init.bat           # Initialize git repo
│   ├── push-github.bat        # Push to GitHub
│   ├── pull-remote.bat        # Pull from GitHub
│   ├── sync-github.bat        # Complete sync workflow
│   └── README.md              # Scripts documentation
│
└── archives/                  # Previous versions (for reference)
    ├── V2_roster.html         # Initial version
    ├── V3_roster_dynamic.html # First dynamic version
    ├── V4_roster_dynamic.html # Second iteration
    └── README.md              # Archives documentation
```

## 🐳 Docker Setup

### Prerequisites
- Docker Desktop installed ([Download](https://www.docker.com/products/docker-desktop))

### Quick Start (Windows)

Simply double-click from the `scripts/` folder:
```bash
start.bat          # Start the container
open.bat           # Start & open in browser
stop.bat           # Stop the container
rebuild.bat        # Rebuild from scratch
logs.bat           # View logs
menu.bat           # Interactive menu
```

Or use the interactive menu:
```bash
scripts\menu.bat
```

### Or use docker-compose
```bash
docker-compose up --build -d
```

### Access the Application
```
http://localhost:8080
```

## 📝 Management Scripts

All scripts are located in the `scripts/` folder. See `scripts/README.md` for detailed documentation.

### Docker Management
- **`start.bat`** - Build and start Docker container
- **`stop.bat`** - Stop the running container
- **`open.bat`** - Open app in browser (auto-starts if needed)
- **`logs.bat`** - View live container logs
- **`rebuild.bat`** - Clean rebuild from scratch
- **`menu.bat`** - Interactive Docker management menu
- **`quickfix.bat`** - Quick fix for common issues

### Git & GitHub
- **`git-init.bat`** - Initialize git repository
- **`push-github.bat`** - Push to trickyj/shiftroster
- **`pull-remote.bat`** - Pull remote changes
- **`sync-github.bat`** - Complete sync workflow

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
scripts\logs.bat
```

**Rebuild everything:**
```bash
scripts\rebuild.bat
```

## 📄 License

MIT License - Feel free to use and modify

## 👨‍💻 Development

To make changes:
1. Edit `.html` files
2. Changes auto-reflect due to volume mounts
3. Rebuild with `scripts\rebuild.bat` if needed

## 📚 Archives

Previous versions of the roster are available in the `archives/` folder for reference and historical tracking.

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
scripts\logs.bat
```

---
