#!/bin/bash
# by Arjun Bohara

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if stow is installed
if ! command -v stow &> /dev/null; then
    print_error "GNU Stow is not installed. Please install it first:"
    echo "  Ubuntu/Debian: sudo apt install stow"
    echo "  Arch Linux: sudo pacman -S stow"
    echo "  Fedora: sudo dnf install stow"
    exit 1
fi

# Welcome message
echo "✨ Dotfiles Installation Script ✨"
echo "by Arjun Bohara"
echo "=================================="
echo

# Get the directory where the script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOTFILES_DIR="$(dirname "$SCRIPT_DIR")"

print_status "Dotfiles directory: $DOTFILES_DIR"

# Change to dotfiles directory
cd "$DOTFILES_DIR"

# Create backup
print_status "Creating backup of existing configurations..."
./scripts/backup.sh

# Install configurations using stow
print_status "Installing dotfiles using GNU Stow..."

# List of configurations to install
configs=(
    "bash:.bashrc"
    "zsh:.zshrc"
    "git:.gitconfig"
    "vim:.vimrc"
    "nvim:.config/nvim"
    "alacritty:.config/alacritty"
    "hypr:.config/hypr"
    "starship:.config/starship"
    "polybar:.config/polybar"
)

for config in "${configs[@]}"; do
    name="${config%%:*}"
    path="${config##*:}"
    
    if [[ -f "$path" ]] || [[ -d "$path" ]]; then
        print_status "Installing $name configuration..."
        stow --target="$HOME" --restow "$name" 2>/dev/null || {
            print_warning "Failed to install $name configuration"
        }
    else
        print_warning "Configuration file/directory not found: $path"
    fi
done

# Set executable permissions for scripts
chmod +x scripts/*.sh

print_success "Dotfiles installation completed!"
echo
echo "🌟 Next steps:"
echo "  1. Restart your terminal or run 'source ~/.bashrc' or 'source ~/.zshrc'"
echo "  2. Install Oh My Zsh if using zsh: sh -c \"\$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)\""
echo "  3. Install zsh plugins:"
echo "     - zsh-autosuggestions: git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions"
echo "     - zsh-syntax-highlighting: git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting"
echo "  4. Install Starship prompt: curl -sS https://starship.rs/install.sh | sh"
echo
echo "✅ Installation completed successfully!"
echo "💖 Credits: Arjun Bohara"
