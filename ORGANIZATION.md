# Project Organization Guide

## Current State
The project root currently contains many `.bat` files and old roster versions mixed together.

## Target State
Clean, organized structure with:
- ✅ Main application in root (V5 only)
- ✅ Docker configuration in root
- ✅ All scripts in `scripts/` folder
- ✅ Old rosters in `archives/` folder

## Current Files to Organize

### Batch Scripts to Move to `scripts/`
```
start.bat
stop.bat
logs.bat
rebuild.bat
open.bat
menu.bat
quickfix.bat
git-init.bat
git-push.bat
push-github.bat
pull-remote.bat
sync-github.bat
```

### Old Rosters to Move to `archives/`
```
V2_roster.html
roster_v2.html
V3_roster_dynamic.html
V4_roster_dynamic.html
```

### Files to Delete
```
BLANK_README.md      (old template)
README_DOCKER.md     (merged into README.md)
organize.bat         (after done)
ORGANIZE.bat         (after done)
```

## How to Organize

### Using Windows File Manager (Easy)

1. **Create folders**
   - Right-click in project folder
   - Select "New" → "Folder"
   - Name it "scripts"
   - Repeat and name it "archives"

2. **Move .bat files**
   - Select all .bat files in root
   - Cut (Ctrl+X)
   - Open scripts/ folder
   - Paste (Ctrl+V)

3. **Move old rosters**
   - Select V2, V3, V4 roster files
   - Cut (Ctrl+X)
   - Open archives/ folder
   - Paste (Ctrl+V)

4. **Delete old docs**
   - Delete BLANK_README.md
   - Delete README_DOCKER.md

5. **Clean up**
   - Delete organize.bat
   - Delete ORGANIZE.bat

### Result

```
shift-roster/
├── V5_roster_dynamic.html
├── Dockerfile
├── docker-compose.yml
├── nginx.conf
├── README.md
├── LICENSE.txt
├── CHANGELOG.md
├── .gitignore
├── .dockerignore
├── .git/
├── scripts/
│   ├── start.bat
│   ├── stop.bat
│   ├── open.bat
│   ├── logs.bat
│   ├── rebuild.bat
│   ├── menu.bat
│   ├── quickfix.bat
│   ├── git-init.bat
│   ├── push-github.bat
│   ├── git-push.bat
│   ├── pull-remote.bat
│   ├── sync-github.bat
│   └── README.md
└── archives/
    ├── V2_roster.html
    ├── V3_roster_dynamic.html
    ├── V4_roster_dynamic.html
    └── README.md
```

## After Organization

### Run Scripts From Root
```bash
scripts\start.bat     # Start container
scripts\open.bat      # Open in browser
scripts\menu.bat      # Interactive menu
scripts\logs.bat      # View logs
```

### Or Update .gitignore
Make sure these are ignored:
```
scripts/*.bat
archives/
```

## Git Cleanup

After organizing, commit the changes:
```bash
git add .
git commit -m "Organize: Move scripts and archives to separate folders"
git push origin main
```

## Verification Checklist

- [ ] Folders created: `scripts/` and `archives/`
- [ ] All .bat files moved to `scripts/`
- [ ] All old rosters moved to `archives/`
- [ ] BLANK_README.md deleted
- [ ] README_DOCKER.md deleted
- [ ] organize.bat deleted
- [ ] ORGANIZE.bat deleted
- [ ] Root now has only: V5, Docker files, docs, folders
- [ ] Scripts still work from new location
- [ ] README.md updated with new structure

## Updating Scripts Folder

Once moved to `scripts/`, scripts need to know they're in a subfolder. The paths in the scripts are relative, so:
- All docker-compose references should still work (look in parent)
- File operations should reference parent directory appropriately

If needed, update scripts with:
```batch
cd ..
docker-compose ...
cd -
```

Or better, update all working directories to handle this automatically (already done in most scripts).
