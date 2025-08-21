<h1 align="center">✨ Ultimate Dotfiles – by Arjun-Kun ✨</h1>

<p align="center">
  <img src="https://readme-typing-svg.herokuapp.com?font=Fira+Code&size=22&pause=1000&color=00C896&center=true&vCenter=true&width=650&lines=Welcome+to+Arjun-Kun's+Ultimate+Dotfiles!;Custom+Linux+Configs+%26+Setup;Beautiful+CLI+%2B+GUI+Installer;Neovim+%7C+Hyprland+%7C+Alacritty;Made+with+%E2%9D%A4%EF%B8%8F+by+Arjun-Kun" alt="Typing Animation" />
</p>

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Author](https://img.shields.io/badge/Author-Arjun--Kun-blue.svg)](https://github.com/Arjun-Kun)

---

## 🌟 Features

* **Shell Configurations** ⚡

  * Bash with custom aliases and PS1 prompt
  * Zsh with Oh My Zsh, Agnoster theme, autosuggestions, and syntax highlighting
* **Development Tools** 💻

  * Neovim with modern configuration and plugins
  * Vim with essential settings and desert colorscheme
  * Git aliases and user configuration
* **Terminal & UI** 🎨

  * Alacritty terminal with custom colors and opacity
  * Hyprland window manager configuration
  * Starship prompt with custom symbols
  * Polybar status bar with system modules
* **Installation Tools** 🛠️

  * CLI installer using GNU Stow
  * GUI installer with Zenity checkboxes
  * Automatic backup and update scripts

---

## 🚀 Installation Methods

### 🔹 Method 1 (Recommended): GUI Installer with Checkboxes

```bash
# Clone and navigate
git clone https://github.com/Arjun-Kun/Ultimate-Dotfiles.git ~/dotfiles
cd ~/dotfiles

# Make scripts executable
chmod +x scripts/*.sh

# Launch GUI installer with checkboxes
./scripts/gui-install.sh
```

### 🔹 Method 2: Automated CLI Installation

```bash
# Clone the repository
git clone https://github.com/Arjun-Kun/Ultimate-Dotfiles.git ~/dotfiles
cd ~/dotfiles

# Make scripts executable
chmod +x scripts/*.sh

# Run the installer (uses GNU Stow)
./scripts/install.sh
```

### 🔹 Method 3: ZIP Download

1. [Download ZIP](https://github.com/Arjun-Kun/Ultimate-Dotfiles/archive/refs/heads/main.zip)
2. Extract and run installer:

   ```bash
   unzip Ultimate-Dotfiles-main.zip -d ~/dotfiles
   cd ~/dotfiles/scripts
   bash install.sh
   ```

---

## 📁 Repository Structure

```
dotfiles/
├── .config/
│   ├── alacritty/
│   │   └── alacritty.yml
│   ├── hypr/
│   │   └── hyprland.conf
│   ├── nvim/
│   │   └── init.vim
│   ├── polybar/
│   │   └── config
│   └── starship/
│       └── starship.toml
├── scripts/
│   ├── install.sh
│   ├── gui-install.sh
│   ├── backup.sh
│   └── update.sh
├── .bashrc
├── .zshrc
├── .gitconfig
├── .vimrc
├── README.md
└── LICENSE
```

---

## 🎯 Components

### Shell Configurations

* **Bash**: Custom PS1 prompt, useful aliases (ll, gs, gc, gp)
* **Zsh**: Oh My Zsh with Agnoster theme, autosuggestions, syntax highlighting

### Editor Configurations

* **Neovim**: Modern configuration with relative numbers, cursor line, GUI colors
* **Vim**: Classic setup with line numbers, syntax highlighting, desert theme

### Terminal & Window Manager

* **Alacritty**: Custom colors, opacity, padding, font size 12
* **Hyprland**: Monitor setup, input layout, autostart applications
* **Starship**: Custom prompt with success/error symbols
* **Polybar**: System monitoring with CPU, memory, date modules

---

## 🔧 Management Scripts

* `install.sh` - Install configurations using GNU Stow
* `gui-install.sh` - GUI installer with component selection
* `backup.sh` - Backup existing configurations
* `update.sh` - Update dotfiles from repository

---

## 📸 Screenshots

*Add your screenshots here to showcase your setup*

---

## 📜 License

MIT License © 2025 **Arjun-Kun**

---

<h2 align="center">💖 Made with Love by <a href="https://github.com/Arjun-Kun">Arjun-Kun</a></h2>

<p align="center">
  <img src="https://github-readme-streak-stats.herokuapp.com?user=Arjun-Kun&theme=radical&hide_border=true" alt="GitHub Streak" />
</p>
```
