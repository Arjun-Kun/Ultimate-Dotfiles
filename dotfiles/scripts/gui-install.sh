#!/bin/bash
# by Arjun Bohara

set -e

# Check if zenity is installed
if ! command -v zenity &> /dev/null; then
    echo "Zenity is not installed. Please install it first:"
    echo "  Ubuntu/Debian: sudo apt install zenity"
    echo "  Arch Linux: sudo pacman -S zenity"
    echo "  Fedora: sudo dnf install zenity"
    exit 1
fi

# Check if stow is installed
if ! command -v stow &> /dev/null; then
    zenity --error --text="GNU Stow is not installed. Please install it first:\n\nUbuntu/Debian: sudo apt install stow\nArch Linux: sudo pacman -S stow\nFedora: sudo dnf install stow"
    exit 1
fi

# Get the directory where the script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOTFILES_DIR="$(dirname "$SCRIPT_DIR")"

# Change to dotfiles directory
cd "$DOTFILES_DIR"

# Welcome dialog
zenity --info --title="Dotfiles Installer" --text="✨ Welcome to Arjun Bohara's Dotfiles Installer ✨\n\nThis will help you install your preferred configurations.\n\nClick OK to continue."

# Component selection dialog
COMPONENTS=$(zenity --list --checklist --title="Select Components to Install" --text="Choose which configurations you want to install:" --column="Install" --column="Component" --column="Description" \
    TRUE "Bash" "Bash shell configuration with aliases and custom prompt" \
    TRUE "Zsh" "Zsh shell with Oh My Zsh, themes, and plugins" \
    TRUE "Git" "Git configuration with user settings and aliases" \
    TRUE "Vim" "Vim editor configuration with syntax highlighting" \
    TRUE "Neovim" "Modern Neovim configuration with enhanced features" \
    TRUE "Alacritty" "Alacritty terminal emulator configuration" \
    FALSE "Hyprland" "Hyprland window manager configuration" \
    TRUE "Starship" "Starship cross-shell prompt configuration" \
    FALSE "Polybar" "Polybar status bar configuration" \
    --separator="|" --width=600 --height=400)

# Check if user cancelled
if [ $? -ne 0 ]; then
    zenity --info --text="Installation cancelled by user."
    exit 0
fi

# Create backup
zenity --info --text="Creating backup of existing configurations..."
./scripts/backup.sh

# Progress dialog
(
    echo "10" ; echo "# Starting installation..."
    sleep 1

    # Install selected components
    IFS='|' read -ra SELECTED <<< "$COMPONENTS"
    total=${#SELECTED[@]}
    current=0

    for component in "${SELECTED[@]}"; do
        current=$((current + 1))
        progress=$((10 + (current * 80 / total)))
        
        echo "$progress"
        echo "# Installing $component configuration..."
        
        case "$component" in
            "Bash")
                stow --target="$HOME" --restow bash 2>/dev/null || true
                ;;
            "Zsh")
                stow --target="$HOME" --restow zsh 2>/dev/null || true
                ;;
            "Git")
                stow --target="$HOME" --restow git 2>/dev/null || true
                ;;
            "Vim")
                stow --target="$HOME" --restow vim 2>/dev/null || true
                ;;
            "Neovim")
                stow --target="$HOME" --restow nvim 2>/dev/null || true
                ;;
            "Alacritty")
                stow --target="$HOME" --restow alacritty 2>/dev/null || true
                ;;
            "Hyprland")
                stow --target="$HOME" --restow hypr 2>/dev/null || true
                ;;
            "Starship")
                stow --target="$HOME" --restow starship 2>/dev/null || true
                ;;
            "Polybar")
                stow --target="$HOME" --restow polybar 2>/dev/null || true
                ;;
        esac
        
        sleep 0.5
    done

    echo "95" ; echo "# Finalizing installation..."
    sleep 1
    
    # Set executable permissions
    chmod +x scripts/*.sh
    
    echo "100" ; echo "# Installation completed!"
    sleep 1

) | zenity --progress --title="Installing Dotfiles" --text="Preparing installation..." --percentage=0 --auto-close

# Success dialog
zenity --info --title="Installation Complete" --text="✨ Dotfiles installed successfully! ✨\n\nCredits: Arjun Bohara\n\n🌟 Next steps:\n• Restart your terminal\n• Install Oh My Zsh if using zsh\n• Install required plugins and tools\n\nEnjoy your new setup!" --width=400

echo "✅ GUI installation completed successfully!"
echo "💖 Credits: Arjun Bohara"
