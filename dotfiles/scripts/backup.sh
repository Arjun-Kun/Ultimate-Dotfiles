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

# Create backup directory with timestamp
TIMESTAMP=$(date +"%Y%m%d%H%M%S")
BACKUP_DIR="$HOME/dotfiles-backup-$TIMESTAMP"

print_status "Creating backup directory: $BACKUP_DIR"
mkdir -p "$BACKUP_DIR"

# List of files and directories to backup
backup_items=(
    ".bashrc"
    ".zshrc"
    ".gitconfig"
    ".vimrc"
    ".config/nvim"
    ".config/alacritty"
    ".config/hypr"
    ".config/starship"
    ".config/polybar"
)

print_status "Backing up existing configurations..."

backed_up=0
for item in "${backup_items[@]}"; do
    if [[ -f "$HOME/$item" ]] || [[ -d "$HOME/$item" ]]; then
        print_status "Backing up $item"
        
        # Create parent directory structure in backup
        parent_dir=$(dirname "$item")
        if [[ "$parent_dir" != "." ]]; then
            mkdir -p "$BACKUP_DIR/$parent_dir"
        fi
        
        # Copy the file or directory
        cp -r "$HOME/$item" "$BACKUP_DIR/$item" 2>/dev/null || {
            print_warning "Failed to backup $item"
            continue
        }
        
        backed_up=$((backed_up + 1))
    fi
done

if [[ $backed_up -gt 0 ]]; then
    print_success "Backup completed! $backed_up items backed up to:"
    echo "  $BACKUP_DIR"
    echo
    echo "📁 Backup contents:"
    ls -la "$BACKUP_DIR"
else
    print_warning "No existing configurations found to backup."
    rmdir "$BACKUP_DIR" 2>/dev/null || true
fi

echo
echo "💖 Backup script by Arjun Bohara"
