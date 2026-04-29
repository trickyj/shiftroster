# Auto Git Sync Scripts

This folder contains scripts for automated Git synchronization with GitHub.

## Scripts

### `auto-sync.bat` - File Watcher (Automatic)
**Continuously monitors folder and auto-commits & pushes changes**

```bash
auto-sync.bat
```

**What it does:**
- ✅ Watches for file changes every 5 seconds
- ✅ Auto-stages all changes (`git add .`)
- ✅ Auto-commits with timestamp
- ✅ Auto-pushes to GitHub

**Usage:**
- Double-click to start watching
- Press `Ctrl+C` to stop
- Runs continuously in background

**Best for:**
- Active development
- Real-time syncing
- Never forgetting to commit

### `quick-sync.bat` - Manual Commit & Push
**One-time commit and push operation**

```bash
quick-sync.bat
```

**What it does:**
- ✅ Stages all changes
- ✅ Commits once with timestamp
- ✅ Pushes to GitHub
- ✅ Closes automatically

**Usage:**
- Double-click when ready to save
- Commits once and exits
- Good for milestone commits

**Best for:**
- Manual control
- Deliberate commits
- Before pulling from team

## Workflow Recommendations

### Option 1: Always-On Auto-Sync (Recommended for solo work)
```bash
1. Run: auto-sync.bat
2. Leave it running
3. All changes auto-commit & push every 5 seconds
4. Press Ctrl+C to stop
```

### Option 2: Manual Commit When Ready
```bash
1. Work on files
2. When ready: quick-sync.bat
3. Changes committed and pushed
4. Back to work
```

### Option 3: Hybrid Approach
```bash
1. Use auto-sync.bat while developing
2. Use quick-sync.bat for important milestones
3. Gives you flexibility and safety
```

## Configuration

### Change Auto-Sync Interval
Edit `auto-sync.bat` line with `timeout /t 5`:
```batch
timeout /t 30  # Check every 30 seconds instead of 5
```

### Change Commit Message Format
Edit the commit message in either script:
```batch
git commit -m "Update: !mydate! !mytime!"
```

### Change Push Branch
Replace `main` with your branch name:
```batch
git push origin develop  # For develop branch
```

## Troubleshooting

**Auto-sync not committing**
- Check if there are actual changes
- Make sure `.git` folder exists
- Run `git status` to see current state

**Push fails**
- Check internet connection
- Verify GitHub credentials
- Run `git remote -v` to verify remote URL

**Too many commits**
- Adjust timeout interval in auto-sync.bat
- Or use quick-sync.bat instead for manual control

## Security Notes

⚠️ **These scripts:**
- ✅ Only push to origin/main (safe)
- ✅ Use credentials from Git config
- ✅ Don't push secrets (use .gitignore)

⚠️ **Make sure:**
- .gitignore has sensitive files (.env, keys, etc.)
- No passwords in commits
- .git/config has correct remote URL

## Advanced Usage

### Combine with Docker Scripts
```bash
# Start auto-sync before developing
scripts\auto-sync.bat

# In another terminal:
scripts\start.bat
```

### Check Commit History
```bash
git log --oneline -20  # Last 20 commits
git log --all --graph  # Visual commit graph
```

### Undo Last Commit
```bash
git reset --soft HEAD~1  # Undo last commit, keep changes
git reset --hard HEAD~1  # Undo last commit, lose changes
```

## Performance

- ✅ Minimal CPU usage (5-second intervals)
- ✅ Instant push (no delay)
- ✅ Won't interfere with other git operations
- ✅ Safe to run with other scripts

## Features

| Feature | auto-sync | quick-sync |
|---------|-----------|-----------|
| Auto watches | ✅ | ❌ |
| Manual trigger | ❌ | ✅ |
| Continuous | ✅ | ❌ |
| One-time use | ❌ | ✅ |
| Always-on option | ✅ | ❌ |

---

**Recommended:** Use `auto-sync.bat` for continuous development, `quick-sync.bat` for manual control.
