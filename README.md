<div align="center">

![Stellar Dots Banner](.github/banner.png)

# ✨ Stellar Dots ✨

**Automatic Dotfiles Installer for Hyprland**

*Inspired by the cozy aesthetics of hyprstellar*

[![License: MIT](https://img.shields.io/badge/License-MIT-c4a7e7?style=for-the-badge&logo=opensourceinitiative&logoColor=white)](https://opensource.org/licenses/MIT)
[![Hyprland](https://img.shields.io/badge/Hyprland-Ready-9ccfd8?style=for-the-badge&logo=wayland&logoColor=white)](https://hyprland.org/)
[![Arch Linux](https://img.shields.io/badge/Arch-Supported-eb6f92?style=for-the-badge&logo=archlinux&logoColor=white)](https://archlinux.org/)
[![Stars](https://img.shields.io/github/stars/alanascanferla/stellar-dots?style=for-the-badge&logo=github&color=f6c177&logoColor=white)](https://github.com/alanascanferla/stellar-dots/stargazers)

<p align="center">
  <img src="https://img.shields.io/badge/Glassmorphism-✨-e0def4?style=flat-square" alt="Glassmorphism">
  <img src="https://img.shields.io/badge/Gaming_Ready-🎮-eb6f92?style=flat-square" alt="Gaming">
  <img src="https://img.shields.io/badge/20+_Scripts-🛠️-9ccfd8?style=flat-square" alt="Scripts">
</p>

**Languages:** [🇺🇸 English](#) • [🇧🇷 Português](README.pt-BR.md) • [🇪🇸 Español](#) • [🇫🇷 Français](#)

[Installation](#-installation) • [Features](#-features) • [Themes](#-themes) • [Documentation](#-documentation) • [Screenshots](#-screenshots)

</div>

---

## 🚀 Highlights

<div align="center">

### ✨ New: Glassmorphism Menus
Modern launchers with glass effect, pink/purple/red gradients and intense blur.  
Two styles available: **Compact sidebar** and **Full menu** with search.

### 🎨 Stellar Theme
Exclusive theme with cozy palette and premium design.

### 🎮 Gaming Ready
Automatic GPU detection, drivers and gaming tools.

### 📦 20+ Utility Scripts
Power menu, clipboard, network, bluetooth, pomodoro, backups and much more!

</div>

---

## 🌟 Features

### Core
- ⚡ **One-Command Installation** - Single command for complete setup
- 🎨 **Beautiful Themes** - Rosé Pine, Catppuccin Mocha, Nord and **Stellar (New!)**
- 📊 **Bar Choice** - Waybar (Simple) or Illogical-Impulse (Advanced with AI)
- 🔒 **Automatic Backup** - Your old configs stay safe
- 🚀 **Multi-Distro** - Support for Arch, Fedora, Debian/Ubuntu
- 🎯 **Interactive TUI** - Beautiful terminal interface
- 📝 **Complete Documentation** - Everything documented!

### Utilities
- 🔌 **Power Menu** - Shutdown, restart, lock, suspend
- 📋 **Clipboard Manager** - Clipboard history with search
- 📡 **Network Manager** - Manage WiFi easily
- 🔵 **Bluetooth Manager** - Pair and connect devices
- 🔊 **Audio Switcher** - Switch audio devices
- 😊 **Emoji Picker** - Emoji selector with search

### Gaming
- 🎮 **Gaming Support** - Automatic GPU detection and driver/tool installation
- ⚡ **Performance Profiles** - Performance, Balanced, Power Save modes
- 🎯 **Game Launcher** - Unified launcher for Steam, Lutris, Heroic

### Productivity
- 🍅 **Pomodoro Timer** - Productivity timer with notifications
- 🗂️ **Workspace Manager** - Manage workspaces easily

### System
- 📦 **Update Manager** - Update system, Flatpak, dotfiles
- 💾 **Backup Manager** - Create, restore and manage backups

### Visual
- 🔄 **Theme Switcher** - Switch themes in real-time
- 📸 **Utility Scripts** - Screenshot, wallpaper, screen recording
- 🌊 **Smooth Animations** - Modern transitions and effects
- 💎 **Glassmorphism** - Blur and transparency everywhere
- ✨ **Glassmorphism Menus** - Modern launchers with glass effect (sidebar + full menu)

## 🎨 Themes

### Rosé Pine (Default)
Soft and cozy theme with pink, purple and blue tones. Inspired by hyprstellar.

### Catppuccin Mocha
Modern pastel palette with coffee, chocolate and vibrant colors.

### Nord
Minimalist arctic theme with icy blues and elegant grays.

## 📊 Bar Options

### Waybar (Recommended)
Minimalist and stable top bar with essential modules. Lightweight, fast and easy to customize.

### illogical-impulse (Advanced)
Complete widget system with advanced features:
- 🔍 **Overview** - Live previews of open apps
- 🤖 **Integrated AI** - Gemini API and Ollama
- 🎨 **Auto-generated Colors** - Material Design based on wallpaper
- 🎯 **Advanced Widgets** - Customizable and interactive

> **Note:** illogical-impulse requires more dependencies and is installed via official script from [end-4/dots-hyprland](https://github.com/end-4/dots-hyprland)

## 🎮 Gaming Support

Stellar Dots includes complete gaming setup with:

### Automatic GPU Detection
- ✅ **NVIDIA** - Proprietary drivers + Vulkan
- ✅ **AMD** - Mesa + AMDVLK + Vulkan
- ✅ **Intel** - Mesa + Vulkan
- ✅ **Hybrid Systems** - Support for laptops with dedicated + integrated GPU

### Installed Tools
- 🎮 **Steam** - Gaming platform
- 🎯 **Lutris** - Game manager
- 🍷 **Wine/Proton** - Windows games compatibility
- ⚡ **GameMode** - Performance optimizations
- 📊 **MangoHud** - FPS overlay and monitoring
- 🎨 **GOverlay** - GUI for MangoHud

### Hyprland Optimizations
- Disables animations in games for better performance
- Specific window rules for popular games
- VRR (Variable Refresh Rate) support
- Optimized fullscreen settings

## 📦 What's Included

- **Hyprland** - Wayland compositor with amazing animations
- **Waybar** - Customized top bar with useful modules
- **Kitty** - Fast terminal with blur and transparency
- **Rofi** - Modern app launcher + glassmorphism menus
- **Hyprlock** - Lock screen with blur and effects
- **Hypridle** - Idle and suspend management
- **Starship** - Beautiful and informative prompt
- **Scripts** - 20+ utility scripts (wallpaper, screenshot, theme switcher, gaming, etc)

## 🚀 Installation

### Quick Installation

```bash
git clone https://github.com/alanascanferla/stellar-dots.git
cd stellar-dots
./install.sh
```

### Manual Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/alanascanferla/stellar-dots.git
   cd stellar-dots
   ```

2. **Run the installer:**
   ```bash
   chmod +x install.sh
   ./install.sh
   ```

3. **Follow the on-screen instructions:**
   - Choose whether to install dependencies
   - Select the bar (Waybar or illogical-impulse)
   - Select your favorite theme
   - Wait for installation

4. **Logout and select Hyprland in your display manager**

## ⌨️ Main Shortcuts

| Shortcut | Action |
|----------|--------|
| `Super + Return` | Open terminal |
| `Super + Q` | Close window |
| `Super + D` | App launcher |
| `Super + Space` | Glassmorphism menu (full) |
| `Super + A` | Glassmorphism menu (sidebar) |
| `Super + W` | Change wallpaper |
| `Super + T` | Change theme |
| `Super + L` | Lock screen |
| `Super + Print` | Area screenshot |
| `Print` | Full screenshot |
| `Super + R` | Screen recording |
| `Super + 1-9` | Switch workspace |

[View all shortcuts](docs/HOTKEYS.md)

## 📖 Documentation

- [Complete Installation Guide](docs/INSTALACAO.md)
- [Shortcuts Reference](docs/HOTKEYS.md)
- [Customization Guide](docs/CUSTOMIZACAO.md)
- [Glassmorphism Menu](docs/GLASSMORPHISM_MENU.md)
- [Troubleshooting](docs/TROUBLESHOOTING.md) ⭐ **New!**

## 🖼️ Screenshots

*Screenshots coming soon!*

### ✨ Visual Highlights
- Glassmorphism menu with glass effect and gradients
- Smooth animations and modern transitions
- Blur and transparency throughout the system
- Cozy and comfortable themes

## 🛠️ Dependencies

### Essential
- Hyprland
- Waybar
- Kitty
- Rofi (Wayland)
- Dunst
- SWWW
- Hyprlock
- Hypridle

### Utilities
- grim & slurp (screenshots)
- wl-clipboard
- brightnessctl
- playerctl
- pavucontrol

### Fonts
- JetBrainsMono Nerd Font
- Noto Emoji

### Optional
- Pywal16 (dynamic colorschemes)
- wf-recorder (screen recording)

## 🤝 Contributing

Contributions are welcome! Feel free to:
- Report bugs
- Suggest new features
- Submit pull requests
- Share your custom themes

## 📜 License

This project is under the MIT license. See [LICENSE](LICENSE) for more details.

## 💖 Credits

- Inspired by [hyprstellar](https://github.com/xeji01/hyprstellar)
- [illogical-impulse](https://github.com/end-4/dots-hyprland) by end-4 (advanced bar option)
- [Rosé Pine](https://rosepinetheme.com/) theme
- [Catppuccin](https://github.com/catppuccin/catppuccin) theme
- [Nord](https://www.nordtheme.com/) theme
- [Hyprland](https://hyprland.org/) compositor

## ⭐ Support

If you liked this project, leave a ⭐ on the repository!

---

<div align="center">

**Made with 💜 and lots of ☕**

</div>
