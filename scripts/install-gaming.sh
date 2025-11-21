#!/bin/bash

# ╔═══════════════════════════════════════════════════════════════════════════╗
# ║                   🎮 GAMING TOOLS INSTALLER 🎮                            ║
# ║                       Stellar Dots Gaming                                  ║
# ╚═══════════════════════════════════════════════════════════════════════════╝

DISTRO="$1"
GPU_VENDOR="$2"

install_gaming_arch() {
    echo "🎮 Instalando ferramentas de gaming para Arch Linux..."
    
    # Detect AUR helper
    if command -v paru &> /dev/null; then
        AUR_HELPER="paru"
    elif command -v yay &> /dev/null; then
        AUR_HELPER="yay"
    else
        echo "Instalando paru..."
        sudo pacman -S --needed --noconfirm base-devel git
        git clone https://aur.archlinux.org/paru.git /tmp/paru
        cd /tmp/paru
        makepkg -si --noconfirm
        cd -
        AUR_HELPER="paru"
    fi
    
    # GPU Drivers
    case "$GPU_VENDOR" in
        nvidia)
            echo "📦 Instalando drivers NVIDIA..."
            sudo pacman -S --needed --noconfirm \
                nvidia \
                nvidia-utils \
                nvidia-settings \
                lib32-nvidia-utils \
                opencl-nvidia \
                lib32-opencl-nvidia
            ;;
        amd)
            echo "📦 Instalando drivers AMD..."
            sudo pacman -S --needed --noconfirm \
                mesa \
                lib32-mesa \
                vulkan-radeon \
                lib32-vulkan-radeon \
                libva-mesa-driver \
                lib32-libva-mesa-driver \
                mesa-vdpau \
                lib32-mesa-vdpau
            
            # Optional: AMDVLK (alternative Vulkan driver)
            $AUR_HELPER -S --needed --noconfirm amdvlk lib32-amdvlk
            ;;
        intel)
            echo "📦 Instalando drivers Intel..."
            sudo pacman -S --needed --noconfirm \
                mesa \
                lib32-mesa \
                vulkan-intel \
                lib32-vulkan-intel \
                intel-media-driver \
                libva-intel-driver
            ;;
        hybrid-*)
            echo "📦 Instalando drivers para sistema híbrido..."
            # Install both NVIDIA and Intel/AMD
            sudo pacman -S --needed --noconfirm \
                nvidia \
                nvidia-utils \
                lib32-nvidia-utils \
                mesa \
                lib32-mesa \
                vulkan-intel \
                lib32-vulkan-intel
            
            # Install optimus-manager for hybrid graphics
            $AUR_HELPER -S --needed --noconfirm optimus-manager optimus-manager-qt
            sudo systemctl enable optimus-manager
            ;;
    esac
    
    # Vulkan tools
    sudo pacman -S --needed --noconfirm \
        vulkan-icd-loader \
        lib32-vulkan-icd-loader \
        vulkan-tools
    
    # Gaming platforms
    echo "🎮 Instalando plataformas de jogos..."
    sudo pacman -S --needed --noconfirm \
        steam \
        lutris \
        wine-staging \
        winetricks \
        wine-gecko \
        wine-mono \
        lib32-gnutls \
        lib32-libldap \
        lib32-libgpg-error \
        lib32-sqlite \
        lib32-libpulse
    
    # Gaming tools
    echo "🛠️ Instalando ferramentas de gaming..."
    sudo pacman -S --needed --noconfirm \
        gamemode \
        lib32-gamemode \
        mangohud \
        lib32-mangohud \
        goverlay
    
    # ProtonUp-Qt for easy Proton management
    $AUR_HELPER -S --needed --noconfirm protonup-qt
    
    echo "✓ Ferramentas de gaming instaladas!"
}

install_gaming_fedora() {
    echo "🎮 Instalando ferramentas de gaming para Fedora..."
    
    # Enable RPM Fusion
    sudo dnf install -y \
        https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
        https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
    
    # GPU Drivers
    case "$GPU_VENDOR" in
        nvidia)
            echo "📦 Instalando drivers NVIDIA..."
            sudo dnf install -y \
                akmod-nvidia \
                xorg-x11-drv-nvidia \
                xorg-x11-drv-nvidia-libs \
                xorg-x11-drv-nvidia-libs.i686 \
                nvidia-settings \
                vulkan
            ;;
        amd)
            echo "📦 Instalando drivers AMD..."
            sudo dnf install -y \
                mesa-dri-drivers \
                mesa-vulkan-drivers \
                mesa-vulkan-drivers.i686
            ;;
        intel)
            echo "📦 Instalando drivers Intel..."
            sudo dnf install -y \
                mesa-dri-drivers \
                mesa-vulkan-drivers \
                intel-media-driver
            ;;
    esac
    
    # Gaming platforms
    echo "🎮 Instalando plataformas de jogos..."
    sudo dnf install -y \
        steam \
        lutris \
        wine \
        winetricks
    
    # Gaming tools
    echo "🛠️ Instalando ferramentas de gaming..."
    sudo dnf install -y \
        gamemode \
        mangohud \
        goverlay
    
    echo "✓ Ferramentas de gaming instaladas!"
}

install_gaming_debian() {
    echo "🎮 Instalando ferramentas de gaming para Debian/Ubuntu..."
    
    # Enable 32-bit architecture
    sudo dpkg --add-architecture i386
    sudo apt update
    
    # GPU Drivers
    case "$GPU_VENDOR" in
        nvidia)
            echo "📦 Instalando drivers NVIDIA..."
            sudo apt install -y \
                nvidia-driver \
                nvidia-settings \
                nvidia-vulkan-icd \
                nvidia-vulkan-icd:i386
            ;;
        amd)
            echo "📦 Instalando drivers AMD..."
            sudo apt install -y \
                mesa-vulkan-drivers \
                mesa-vulkan-drivers:i386 \
                libgl1-mesa-dri:i386
            ;;
        intel)
            echo "📦 Instalando drivers Intel..."
            sudo apt install -y \
                mesa-vulkan-drivers \
                intel-media-va-driver
            ;;
    esac
    
    # Gaming platforms
    echo "🎮 Instalando plataformas de jogos..."
    
    # Steam
    wget https://cdn.cloudflare.steamstatic.com/client/installer/steam.deb -O /tmp/steam.deb
    sudo apt install -y /tmp/steam.deb
    
    # Lutris
    sudo add-apt-repository ppa:lutris-team/lutris -y
    sudo apt update
    sudo apt install -y lutris
    
    # Wine
    sudo apt install -y \
        wine \
        winetricks \
        libwine:i386
    
    # Gaming tools
    echo "🛠️ Instalando ferramentas de gaming..."
    sudo apt install -y \
        gamemode \
        mangohud
    
    echo "✓ Ferramentas de gaming instaladas!"
}

case "$DISTRO" in
    arch)
        install_gaming_arch
        ;;
    fedora)
        install_gaming_fedora
        ;;
    debian)
        install_gaming_debian
        ;;
    *)
        echo "Distro não suportada: $DISTRO"
        exit 1
        ;;
esac

echo ""
echo "🎮 Configuração de gaming concluída!"
echo ""
echo "Ferramentas instaladas:"
echo "  ✓ Drivers GPU ($GPU_VENDOR)"
echo "  ✓ Steam"
echo "  ✓ Lutris"
echo "  ✓ Wine/Proton"
echo "  ✓ GameMode"
echo "  ✓ MangoHud"
echo ""
echo "Dicas:"
echo "  • Use GameMode para melhor performance: gamemoderun %command%"
echo "  • Use MangoHud para FPS overlay: mangohud %command%"
echo "  • Configure Proton no Steam para jogos Windows"
