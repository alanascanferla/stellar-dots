# 🔧 Troubleshooting - Stellar Dots

Guia de solução de problemas comuns. Se você encontrou algum problema, provavelmente a solução está aqui!

---

## 📋 Índice

- [Problemas de Instalação](#-problemas-de-instalação)
- [Problemas de Display](#-problemas-de-display)
- [Problemas de GPU](#-problemas-de-gpu)
- [Problemas de Tema](#-problemas-de-tema)
- [Problemas de Scripts](#-problemas-de-scripts)
- [Problemas de Gaming](#-problemas-de-gaming)
- [Outros Problemas](#-outros-problemas)

---

## 🚀 Problemas de Instalação

### Dependências faltando

**Sintomas:**
- Erro "command not found" durante instalação
- Instalação falha no meio do processo

**Solução:**
```bash
# Arch/Manjaro
sudo pacman -Syu
sudo pacman -S base-devel git

# Fedora
sudo dnf update
sudo dnf install @development-tools git

# Ubuntu/Debian
sudo apt update
sudo apt install build-essential git
```

### Permissões negadas

**Sintomas:**
- "Permission denied" ao executar install.sh
- Não consegue criar arquivos em ~/.config

**Solução:**
```bash
# Dar permissão de execução
chmod +x install.sh

# Verificar propriedade do diretório home
ls -la ~ | grep .config

# Se necessário, corrigir permissões
sudo chown -R $USER:$USER ~/.config
```

### Conflitos com configs existentes

**Sintomas:**
- Instalação pergunta sobre sobrescrever arquivos
- Configs antigas interferem

**Solução:**
```bash
# Fazer backup manual antes
cp -r ~/.config/hypr ~/.config/hypr.backup
cp -r ~/.config/waybar ~/.config/waybar.backup

# Ou usar o backup automático do instalador
# (ele já faz isso por padrão)
```

---

## 🖥️ Problemas de Display

### Wayland não inicia

**Sintomas:**
- Tela preta após login
- Volta para tela de login
- Erro "Failed to start Hyprland"

**Causas Possíveis:**
1. Drivers de GPU não instalados
2. Wayland não suportado pela GPU
3. Conflito com X11

**Solução 1: Verificar logs**
```bash
# Ver logs do Hyprland
cat /tmp/hypr/$(ls -t /tmp/hypr/ | head -n 1)/hyprland.log

# Ver logs do sistema
journalctl -xe | grep hyprland
```

**Solução 2: Drivers**
```bash
# NVIDIA
sudo pacman -S nvidia nvidia-utils  # Arch
sudo dnf install akmod-nvidia        # Fedora

# AMD
sudo pacman -S mesa vulkan-radeon    # Arch
sudo dnf install mesa-vulkan-drivers # Fedora
```

**Solução 3: Forçar Wayland**
```bash
# Adicionar ao ~/.bash_profile
export XDG_SESSION_TYPE=wayland
export GDK_BACKEND=wayland
export QT_QPA_PLATFORM=wayland
```

### Resolução errada

**Sintomas:**
- Tela muito grande ou pequena
- Resolução não é a nativa

**Solução:**
```bash
# Editar ~/.config/hypr/hyprland.conf
# Linha 10: monitor=,preferred,auto,1

# Para resolução específica:
monitor=DP-1,1920x1080@144,0x0,1

# Para múltiplos monitores:
monitor=DP-1,1920x1080@144,0x0,1
monitor=HDMI-A-1,1920x1080@60,1920x0,1
```

### Multi-monitor não funciona

**Sintomas:**
- Segundo monitor não detectado
- Monitores duplicados em vez de estendidos

**Solução:**
```bash
# Listar monitores disponíveis
hyprctl monitors

# Configurar no hyprland.conf
monitor=DP-1,1920x1080@144,0x0,1       # Monitor principal
monitor=HDMI-A-1,1920x1080@60,1920x0,1 # Monitor secundário à direita

# Recarregar configuração
hyprctl reload
```

---

## 🎮 Problemas de GPU

### NVIDIA não detectada

**Sintomas:**
- `nvidia-smi` não funciona
- Performance muito baixa
- Jogos não usam GPU dedicada

**Solução:**
```bash
# Verificar se GPU é detectada
lspci | grep -i nvidia

# Instalar drivers NVIDIA
sudo pacman -S nvidia nvidia-utils nvidia-settings

# Adicionar módulos ao kernel
sudo nano /etc/mkinitcpio.conf
# MODULES=(nvidia nvidia_modeset nvidia_uvm nvidia_drm)

# Regenerar initramfs
sudo mkinitcpio -P

# Reiniciar
reboot
```

### Performance baixa

**Sintomas:**
- FPS baixo em jogos
- Animações travadas
- Desktop lento

**Solução 1: Verificar GPU em uso**
```bash
# Ver qual GPU está ativa
glxinfo | grep "OpenGL renderer"

# Para laptops híbridos, usar GPU dedicada
# Adicionar ao hyprland.conf:
env = WLR_DRM_DEVICES,/dev/dri/card1
```

**Solução 2: Desabilitar animações**
```bash
# Editar ~/.config/hypr/hyprland.conf
animations {
    enabled = false  # Temporariamente
}
```

**Solução 3: Ajustar blur**
```bash
# Reduzir blur para melhor performance
decoration {
    blur {
        size = 3      # Reduzir de 6
        passes = 1    # Reduzir de 3
    }
}
```

### Tearing (rasgamento de tela)

**Sintomas:**
- Imagem "rasgada" ao mover janelas
- Linhas horizontais na tela

**Solução:**
```bash
# Habilitar VRR no hyprland.conf
misc {
    vrr = 1  # Variable Refresh Rate
}

# Para NVIDIA, adicionar:
env = __GL_GSYNC_ALLOWED,1
env = __GL_VRR_ALLOWED,1
```

---

## 🎨 Problemas de Tema

### Cores não aplicam

**Sintomas:**
- Tema não muda
- Cores erradas
- Wallpaper não atualiza

**Solução:**
```bash
# Recarregar Hyprland
hyprctl reload

# Reiniciar Waybar
killall waybar && waybar &

# Aplicar tema manualmente
~/.local/bin/theme-switcher.sh
```

### Ícones quebrados

**Sintomas:**
- Quadrados em vez de ícones
- Símbolos não aparecem

**Solução:**
```bash
# Instalar Nerd Fonts
sudo pacman -S ttf-jetbrains-mono-nerd

# Instalar tema de ícones
sudo pacman -S papirus-icon-theme

# Atualizar cache de fontes
fc-cache -fv

# Reiniciar Waybar
killall waybar && waybar &
```

### Wallpaper não muda

**Sintomas:**
- Wallpaper fica preto
- Comando não funciona

**Solução:**
```bash
# Verificar se SWWW está rodando
pgrep swww

# Se não estiver, iniciar
swww init

# Aplicar wallpaper manualmente
swww img ~/wallpapers/seu-wallpaper.png

# Verificar permissões
ls -la ~/wallpapers/
```

---

## 🛠️ Problemas de Scripts

### Scripts não executam

**Sintomas:**
- "Permission denied" ao executar script
- Atalhos não funcionam

**Solução:**
```bash
# Dar permissão de execução a todos scripts
chmod +x ~/stellar-dots/scripts/*.sh

# Verificar se scripts estão no PATH
echo $PATH | grep .local/bin

# Copiar scripts para ~/.local/bin
cp ~/stellar-dots/scripts/*.sh ~/.local/bin/
```

### Rofi não abre

**Sintomas:**
- Atalho não funciona
- Erro "rofi not found"

**Solução:**
```bash
# Instalar Rofi Wayland
sudo pacman -S rofi-wayland  # Arch
sudo dnf install rofi         # Fedora

# Testar manualmente
rofi -show drun

# Verificar keybinding no hyprland.conf
grep "rofi" ~/.config/hypr/hyprland.conf
```

### Clipboard não funciona

**Sintomas:**
- Histórico vazio
- Copiar/colar não funciona

**Solução:**
```bash
# Instalar cliphist
sudo pacman -S cliphist

# Iniciar wl-paste
wl-paste --watch cliphist store &

# Adicionar ao hyprland.conf exec-once
exec-once = wl-paste --watch cliphist store
```

---

## 🎮 Problemas de Gaming

### Jogos não iniciam

**Sintomas:**
- Steam não abre jogos
- Erro ao iniciar

**Solução:**
```bash
# Instalar dependências de gaming
sudo pacman -S steam wine-staging winetricks

# Para jogos Windows
sudo pacman -S wine-staging wine-gecko wine-mono

# Habilitar Proton no Steam
# Steam > Settings > Compatibility > Enable Steam Play
```

### FPS baixo em jogos

**Sintomas:**
- Performance ruim
- Travamentos

**Solução:**
```bash
# Usar perfil de performance
~/.local/bin/performance-profile.sh

# Desabilitar compositor durante jogos
# Hyprland já faz isso automaticamente

# Usar GameMode
gamemoderun %command%  # No Steam launch options
```

### MangoHud não aparece

**Sintomas:**
- Overlay não mostra

**Solução:**
```bash
# Instalar MangoHud
sudo pacman -S mangohud

# Usar no Steam launch options
mangohud %command%

# Ou via terminal
mangohud game-executable
```

---

## ❓ Outros Problemas

### Áudio não funciona

**Sintomas:**
- Sem som
- Microfone não funciona

**Solução:**
```bash
# Instalar PipeWire
sudo pacman -S pipewire pipewire-pulse pipewire-alsa

# Reiniciar serviço
systemctl --user restart pipewire pipewire-pulse

# Testar
pactl list sinks
```

### WiFi não conecta

**Sintomas:**
- Rede não aparece
- Não conecta

**Solução:**
```bash
# Usar NetworkManager
sudo systemctl enable NetworkManager
sudo systemctl start NetworkManager

# Conectar via terminal
nmcli device wifi list
nmcli device wifi connect "SSID" password "senha"
```

### Bluetooth não funciona

**Sintomas:**
- Dispositivos não aparecem
- Não pareia

**Solução:**
```bash
# Instalar e habilitar
sudo pacman -S bluez bluez-utils
sudo systemctl enable bluetooth
sudo systemctl start bluetooth

# Conectar via terminal
bluetoothctl
> power on
> scan on
> pair XX:XX:XX:XX:XX:XX
> connect XX:XX:XX:XX:XX:XX
```

---

## 🆘 Ainda com Problemas?

Se nenhuma solução funcionou:

1. **Verifique os logs:**
   ```bash
   journalctl -xe
   cat /tmp/hypr/*/hyprland.log
   ```

2. **Abra uma issue no GitHub:**
   - https://github.com/NoctuaCoder/stellar-dots/issues
   - Inclua: logs, distro, GPU, descrição do problema

3. **Restaure backup:**
   ```bash
   # Se tiver backup
   rm -rf ~/.config/hypr
   mv ~/.config/hypr.backup ~/.config/hypr
   ```

4. **Reinstale:**
   ```bash
   cd stellar-dots
   ./install.sh
   ```

---

<div align="center">

**Precisa de mais ajuda?** 

[Abrir Issue](https://github.com/NoctuaCoder/stellar-dots/issues) • [Documentação](../README.md)

</div>
