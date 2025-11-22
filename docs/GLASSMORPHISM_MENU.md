# 🎨 Glassmorphism Menu Launcher

Menu launcher moderno com efeito glassmorphism inspirado em designs de apps premium. Disponível em dois estilos para o Stellar Dots.

![Glassmorphism Menu](file:///home/alana/.gemini/antigravity/brain/5bdb9e8a-b657-4e6e-b12b-174f534b5407/uploaded_image_1763784439735.jpg)

## 🌟 Estilos Disponíveis

### Sidebar Launcher
Menu vertical compacto posicionado à esquerda da tela.

**Características:**
- Layout vertical fino (90px de largura)
- Ícones grandes centralizados
- Texto pequeno abaixo dos ícones
- Fundo transparente com blur
- Gradiente rosa → vermelho sutil
- Perfeito para acesso rápido

**Atalho:** `SUPER + A`

---

### Full Menu
Menu expandido centralizado com busca e categorias.

**Características:**
- Layout grid com 2 colunas
- Barra de busca no topo
- Ícones + texto lado a lado
- Fundo altamente transparente
- Gradiente rosa → roxo → vermelho
- Scrollbar customizada
- Suporte a múltiplos modos (drun/run)

**Atalho:** `SUPER + SPACE`

## 🎯 Uso

### Via Atalhos de Teclado

```bash
# Full menu (padrão)
SUPER + SPACE

# Sidebar compacto
SUPER + A
```

### Via Terminal

```bash
# Lançar full menu
~/stellar-dots/scripts/app-menu.sh full

# Lançar sidebar
~/stellar-dots/scripts/app-menu.sh sidebar

# Ver ajuda
~/stellar-dots/scripts/app-menu.sh --help
```

## 🎨 Customização

### Cores e Gradientes

Edite os arquivos de tema para personalizar as cores:

**Sidebar:** `~/.config/rofi/glassmorphism-sidebar.rasi`
```css
gradient-start: #eb6f9280;  /* Rosa */
gradient-end: #ea384880;    /* Vermelho */
```

**Full Menu:** `~/.config/rofi/glassmorphism-full.rasi`
```css
gradient-start: #eb6f9260;  /* Rosa */
gradient-mid: #c4a7e760;    /* Roxo */
gradient-end: #ea384860;    /* Vermelho */
```

### Transparência e Blur

Ajuste a opacidade do fundo:

```css
bg-glass: #1f1d2e40;  /* Mais transparente: 20-40 */
bg-glass: #1f1d2e80;  /* Menos transparente: 60-80 */
```

O blur é controlado pelo Hyprland em `~/.config/hypr/hyprland.conf`:

```conf
decoration {
    blur {
        enabled = true
        size = 6        # Tamanho do blur
        passes = 3      # Qualidade (mais = melhor)
    }
}
```

### Tamanho e Posicionamento

**Sidebar:**
```css
window {
    width: 90px;      # Largura da barra
    x-offset: 12px;   # Distância da borda
}
```

**Full Menu:**
```css
window {
    width: 720px;     # Largura do menu
    height: 580px;    # Altura do menu
}
```

### Ícones

Para mudar o tema de ícones, edite a linha:

```css
configuration {
    icon-theme: "Papirus-Dark";  # Seu tema aqui
}
```

Temas populares:
- `Papirus-Dark`
- `Tela`
- `Numix-Circle`
- `Flatery-Dark`

## 🔧 Configuração do Hyprland

As seguintes configurações foram adicionadas ao `hyprland.conf`:

### Window Rules
```conf
# Rofi glassmorphism effects
windowrulev2 = opacity 0.85 0.85, class:^(Rofi)$
windowrulev2 = animation slide, class:^(Rofi)$
windowrulev2 = stayfocused, class:^(Rofi)$
```

### Keybindings
```conf
# Glassmorphism Launchers
bind = $mainMod, Space, exec, ~/stellar-dots/scripts/app-menu.sh full
bind = $mainMod, A, exec, ~/stellar-dots/scripts/app-menu.sh sidebar
```

## 🐛 Troubleshooting

### O blur não está funcionando

1. Verifique se o blur está habilitado no Hyprland:
   ```bash
   grep -A 5 "blur {" ~/.config/hypr/hyprland.conf
   ```

2. Recarregue a configuração:
   ```bash
   hyprctl reload
   ```

### Os ícones não aparecem

1. Instale um tema de ícones:
   ```bash
   # Arch/Manjaro
   sudo pacman -S papirus-icon-theme
   
   # Fedora
   sudo dnf install papirus-icon-theme
   
   # Ubuntu/Debian
   sudo apt install papirus-icon-theme
   ```

2. Verifique se `show-icons` está habilitado no tema.

### O menu não abre

1. Teste o tema manualmente:
   ```bash
   rofi -show drun -theme ~/.config/rofi/glassmorphism-full.rasi
   ```

2. Verifique erros:
   ```bash
   rofi -show drun -theme ~/.config/rofi/glassmorphism-full.rasi -no-lazy-grab
   ```

### Animações estão lentas

Ajuste as animações no Hyprland:

```conf
animations {
    animation = windows, 1, 4, wind, slide  # Reduzir de 6 para 4
}
```

## 💡 Dicas

1. **Combine com wallpapers escuros** para melhor contraste
2. **Use o sidebar** para acesso rápido aos apps favoritos
3. **Use o full menu** para buscar apps por nome
4. **Personalize as cores** para combinar com seu tema
5. **Ajuste a transparência** conforme sua preferência

## 🎨 Inspiração

Este design foi inspirado em interfaces modernas de apps mobile com glassmorphism, especialmente o design do YouTube mostrado na imagem de referência.

---

**Feito com 💜 para o Stellar Dots**
