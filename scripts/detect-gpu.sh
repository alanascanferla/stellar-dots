#!/bin/bash

# ╔═══════════════════════════════════════════════════════════════════════════╗
# ║                       🎮 GPU DETECTION SCRIPT 🎮                          ║
# ║                          Stellar Dots Gaming                               ║
# ╚═══════════════════════════════════════════════════════════════════════════╝

# Colors
RESET='\033[0m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'

# Detect GPU vendor
detect_gpu() {
    echo -e "${CYAN}🔍 Detectando GPU...${RESET}"
    echo ""
    
    # Check for NVIDIA
    if lspci | grep -i "vga\|3d\|display" | grep -iq nvidia; then
        GPU_VENDOR="nvidia"
        GPU_MODEL=$(lspci | grep -i "vga\|3d" | grep -i nvidia | cut -d: -f3 | sed 's/^[ \t]*//')
        echo -e "${GREEN}✓ NVIDIA GPU detectada:${RESET} $GPU_MODEL"
    fi
    
    # Check for AMD
    if lspci | grep -i "vga\|3d\|display" | grep -iq amd; then
        if [ -n "$GPU_VENDOR" ]; then
            GPU_VENDOR="hybrid-amd"
            GPU_MODEL_AMD=$(lspci | grep -i "vga\|3d" | grep -i amd | cut -d: -f3 | sed 's/^[ \t]*//')
            echo -e "${GREEN}✓ AMD GPU detectada:${RESET} $GPU_MODEL_AMD"
            echo -e "${YELLOW}⚠ Sistema híbrido detectado (NVIDIA + AMD)${RESET}"
        else
            GPU_VENDOR="amd"
            GPU_MODEL=$(lspci | grep -i "vga\|3d" | grep -i amd | cut -d: -f3 | sed 's/^[ \t]*//')
            echo -e "${GREEN}✓ AMD GPU detectada:${RESET} $GPU_MODEL"
        fi
    fi
    
    # Check for Intel
    if lspci | grep -i "vga\|3d\|display" | grep -iq intel; then
        if [ -n "$GPU_VENDOR" ]; then
            GPU_VENDOR="hybrid-intel"
            GPU_MODEL_INTEL=$(lspci | grep -i "vga\|3d" | grep -i intel | cut -d: -f3 | sed 's/^[ \t]*//')
            echo -e "${GREEN}✓ Intel GPU detectada:${RESET} $GPU_MODEL_INTEL"
            echo -e "${YELLOW}⚠ Sistema híbrido detectado${RESET}"
        else
            GPU_VENDOR="intel"
            GPU_MODEL=$(lspci | grep -i "vga\|3d" | grep -i intel | cut -d: -f3 | sed 's/^[ \t]*//')
            echo -e "${GREEN}✓ Intel GPU detectada:${RESET} $GPU_MODEL"
        fi
    fi
    
    # Unknown GPU
    if [ -z "$GPU_VENDOR" ]; then
        GPU_VENDOR="unknown"
        GPU_MODEL="Desconhecida"
        echo -e "${YELLOW}⚠ GPU não detectada ou não suportada${RESET}"
    fi
    
    echo ""
    export GPU_VENDOR
    export GPU_MODEL
}

# Show GPU info
show_gpu_info() {
    echo -e "${MAGENTA}═══════════════════════════════════════${RESET}"
    echo -e "${CYAN}Informações da GPU${RESET}"
    echo -e "${MAGENTA}═══════════════════════════════════════${RESET}"
    echo ""
    
    case "$GPU_VENDOR" in
        nvidia)
            echo -e "${GREEN}Vendor:${RESET} NVIDIA"
            echo -e "${GREEN}Modelo:${RESET} $GPU_MODEL"
            echo -e "${GREEN}Driver:${RESET} Proprietário NVIDIA (recomendado)"
            echo -e "${GREEN}Vulkan:${RESET} nvidia-utils"
            ;;
        amd)
            echo -e "${GREEN}Vendor:${RESET} AMD"
            echo -e "${GREEN}Modelo:${RESET} $GPU_MODEL"
            echo -e "${GREEN}Driver:${RESET} Mesa (open-source)"
            echo -e "${GREEN}Vulkan:${RESET} vulkan-radeon / amdvlk"
            ;;
        intel)
            echo -e "${GREEN}Vendor:${RESET} Intel"
            echo -e "${GREEN}Modelo:${RESET} $GPU_MODEL"
            echo -e "${GREEN}Driver:${RESET} Mesa (open-source)"
            echo -e "${GREEN}Vulkan:${RESET} vulkan-intel"
            ;;
        hybrid-*)
            echo -e "${YELLOW}Sistema Híbrido Detectado${RESET}"
            echo -e "${GREEN}GPU Dedicada:${RESET} $GPU_MODEL"
            echo -e "${GREEN}GPU Integrada:${RESET} $GPU_MODEL_INTEL"
            echo -e "${CYAN}Recomendação:${RESET} Instalar drivers para ambas"
            ;;
        *)
            echo -e "${YELLOW}GPU não detectada${RESET}"
            ;;
    esac
    
    echo ""
}

# Main
detect_gpu
show_gpu_info
