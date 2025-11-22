#!/usr/bin/env bash

# ═══════════════════════════════════════════════════════════════════════════
#                      ✨ GLASSMORPHISM APP MENU ✨
#                           Stellar Dots Rice
# ═══════════════════════════════════════════════════════════════════════════

ROFI_CONFIG_DIR="$HOME/.config/rofi"

# Default to full menu
STYLE="${1:-full}"

# Help message
show_help() {
    cat << EOF
✨ Glassmorphism App Menu

Usage: $(basename "$0") [STYLE]

Styles:
  full      Full menu with search and categories (default)
  sidebar   Compact vertical sidebar launcher

Examples:
  $(basename "$0")           # Launch full menu
  $(basename "$0") sidebar   # Launch sidebar menu
  $(basename "$0") --help    # Show this help

EOF
}

# Parse arguments
case "$STYLE" in
    -h|--help)
        show_help
        exit 0
        ;;
    sidebar)
        THEME="$ROFI_CONFIG_DIR/glassmorphism-sidebar.rasi"
        ;;
    full)
        THEME="$ROFI_CONFIG_DIR/glassmorphism-full.rasi"
        ;;
    *)
        echo "❌ Unknown style: $STYLE"
        echo "Use --help for usage information"
        exit 1
        ;;
esac

# Check if theme exists
if [ ! -f "$THEME" ]; then
    echo "❌ Theme not found: $THEME"
    exit 1
fi

# Launch Rofi with the selected theme
rofi -show drun -theme "$THEME"
