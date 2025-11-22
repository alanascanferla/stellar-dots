# 📸 Screenshot Guide - Stellar Dots

Guide for capturing beautiful screenshots of your Stellar Dots setup.

## 🎯 What to Capture

### Essential Screenshots

1. **Clean Desktop**
   - Wallpaper + Waybar
   - No windows open
   - Shows workspace indicators

2. **Glassmorphism Menu (Full)**
   - `Super + Space`
   - Shows blur effect
   - Apps visible in background

3. **Glassmorphism Menu (Sidebar)**
   - `Super + A`
   - Compact vertical menu
   - Icons clearly visible

4. **Terminal (Kitty)**
   - Running `fastfetch` or `neofetch`
   - Shows blur and transparency
   - Rosé Pine colors visible

5. **Rofi Menus**
   - Power menu
   - Emoji picker
   - Clipboard manager

6. **Theme Comparison**
   - Same setup with different themes
   - Rosé Pine, Catppuccin, Nord, Stellar

### Optional Screenshots

7. **Gaming Setup** (if installed)
   - MangoHud overlay
   - Game running

8. **Waybar Details**
   - CPU/Memory modules
   - Hover effects (if possible to capture)

9. **Multi-workspace**
   - Different apps on different workspaces

## 📷 How to Take Screenshots

### Using Built-in Script

```bash
# Full screenshot
Print

# Area selection
Super + Print

# Window screenshot
Super + Shift + Print
```

Screenshots are saved to `~/Pictures/Screenshots/`

### Manual with grim + slurp

```bash
# Full screen
grim ~/screenshot.png

# Area selection
grim -g "$(slurp)" ~/screenshot.png

# Specific window
grim -g "$(hyprctl activewindow -j | jq -r '"\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"')" ~/screenshot.png
```

## 🎨 Tips for Beautiful Screenshots

### Lighting & Colors
- Use a colorful wallpaper that complements the theme
- Ensure good contrast between elements
- Capture during "golden hour" if showing real desktop

### Composition
- Center important elements
- Show enough context (wallpaper, bar, etc)
- Avoid clutter - close unnecessary windows

### Glassmorphism Effect
- Have something colorful behind transparent windows
- Ensure blur is visible
- Show gradients clearly

### Terminal Screenshots
- Run `fastfetch` for system info
- Use `btop` for monitoring
- Show colorful output (ls, bat, etc)

## 📐 Recommended Sizes

- **Full Desktop**: Native resolution (1920x1080, 2560x1440, etc)
- **Feature Close-ups**: 1280x720 minimum
- **GIFs**: 1280x720, 30fps, max 10 seconds

## 🎬 Creating GIFs

### Using wf-recorder + ffmpeg

```bash
# Record area
wf-recorder -g "$(slurp)" -f recording.mp4

# Stop recording
killall -s SIGINT wf-recorder

# Convert to GIF
ffmpeg -i recording.mp4 -vf "fps=30,scale=1280:-1:flags=lanczos" -c:v gif output.gif

# Optimize GIF
gifsicle -O3 --lossy=80 -o optimized.gif output.gif
```

### What to Record

1. **Installation Process** (timelapse)
   - From clone to first login
   - Speed up 10x

2. **Theme Switching**
   - Run theme-switcher.sh
   - Show colors changing
   - 5-10 seconds

3. **Glassmorphism Menu**
   - Open menu (Super + Space)
   - Search for app
   - Launch app
   - 5 seconds

4. **Wallpaper Changing**
   - Run wallpaper-changer.sh
   - Show selection
   - Wallpaper changes
   - 5 seconds

## 📁 Organization

Save screenshots in this structure:

```
.github/screenshots/
├── desktop/
│   ├── rose-pine.png
│   ├── catppuccin.png
│   ├── nord.png
│   └── stellar.png
├── features/
│   ├── glassmorphism-full.png
│   ├── glassmorphism-sidebar.png
│   ├── waybar.png
│   ├── terminal.png
│   └── rofi-menus.png
├── themes/
│   ├── comparison.png
│   └── details/
└── demos/
    ├── installation.gif
    ├── theme-switch.gif
    └── menu-demo.gif
```

## ✅ Checklist

Before submitting screenshots:

- [ ] High resolution (1920x1080+)
- [ ] PNG format (lossless)
- [ ] Blur effect visible
- [ ] Colors accurate
- [ ] No personal information visible
- [ ] File size reasonable (<2MB per image)
- [ ] Descriptive filename
- [ ] Organized in correct folder

## 🎨 Example Shots to Take

### Shot 1: Hero Image
- Clean desktop
- Rosé Pine theme
- Beautiful wallpaper
- Waybar visible
- No windows open

### Shot 2: Glassmorphism in Action
- Full menu open (Super + Space)
- Colorful wallpaper behind
- Blur clearly visible
- Apps listed

### Shot 3: Terminal Showcase
- Kitty terminal centered
- Running fastfetch
- Blur and transparency visible
- Rosé Pine colors

### Shot 4: Theme Comparison
- 4 panels showing same view
- Different theme in each
- Side by side comparison

### Shot 5: Features Grid
- Multiple small screenshots
- Each showing a different feature
- Organized in grid layout

## 📤 Submitting Screenshots

Once you have screenshots:

1. **Optimize images**
   ```bash
   # Install optipng
   sudo pacman -S optipng
   
   # Optimize
   optipng -o7 screenshot.png
   ```

2. **Add to repo**
   ```bash
   git add .github/screenshots/
   git commit -m "📸 Add screenshots"
   git push
   ```

3. **Update README**
   - Replace "Screenshots coming soon!"
   - Add image embeds
   - Create carousel if multiple images

## 💡 Pro Tips

- Take screenshots right after fresh install (cleanest look)
- Use consistent wallpaper across theme comparisons
- Capture at same time of day for consistent lighting
- Show real usage, not staged
- Include some personality (your actual apps)

---

**Need inspiration?** Check out:
- r/unixporn
- Hyprland showcase channel
- Other dotfiles repos

**Questions?** Open an issue or discussion!
