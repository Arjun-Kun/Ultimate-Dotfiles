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

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Get the directory where the script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOTFILES_DIR="$(dirname "$SCRIPT_DIR")"

echo "🔄 Dotfiles Update Script"
echo "by Arjun Bohara"
echo "========================"
echo

# Change to dotfiles directory
cd "$DOTFILES_DIR"

# Check if we're in a git repository
if [[ ! -d ".git" ]]; then
    print_error "Not a git repository. Please clone the dotfiles repository first."
    exit 1
fi

# Check for uncommitted changes
if [[ -n $(git status --porcelain) ]]; then
    print_status "You have uncommitted changes. Stashing them..."
    git stash push -m "Auto-stash before update $(date)"
fi

# Pull latest changes
print_status "Pulling latest changes from main branch..."
git fetch origin
git pull origin main || {
    print_error "Failed to pull latest changes. Please check your internet connection and repository access."
    exit 1
}

# Create backup before updating
print_status "Creating backup before update..."
./scripts/backup.sh

# Re-run stow to apply any new configurations
print_status "Applying updated configurations..."

# List of configurations to update
configs=(
    "bash"
    "zsh"
    "git"
    "vim"
    "nvim"
    "alacritty"
    "hypr"
    "starship"
    "polybar"
)

for config in "${configs[@]}"; do
    if [[ -d "$config" ]]; then
        print_status "Updating $config configuration..."
        stow --target="$HOME" --restow "$config" 2>/dev/null || {
            print_status "Skipping $config (not installed or conflicts exist)"
        }
    fi
done

# Set executable permissions for scripts
chmod +x scripts/*.sh

print_success "Dotfiles updated successfully!"
echo
echo "🌟 Changes applied:"
git log --oneline -5
echo
echo "✅ Updated dotfiles - Credits: Arjun Bohara"
echo "💡 Tip: Restart your terminal to apply all changes"
