#!/bin/bash

# ZSH Setup Script - Automated installation of your exact ZSH configuration
# This script will install all dependencies and set up your ZSH environment

set -e  # Exit on any error

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

# Function to check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Function to install packages based on distro
install_packages() {
    print_status "Detecting package manager and installing dependencies..."
    
    if command_exists apt; then
        # Debian/Ubuntu
        print_status "Using apt package manager (Debian/Ubuntu)"
        sudo apt update
        sudo apt install -y zsh neofetch neovim build-essential
    elif command_exists yum; then
        # RHEL/CentOS/Fedora
        print_status "Using yum package manager (RHEL/CentOS/Fedora)"
        sudo yum update -y
        sudo yum install -y zsh neofetch neovim gcc gcc-c++ make
    elif command_exists dnf; then
        # Fedora
        print_status "Using dnf package manager (Fedora)"
        sudo dnf update -y
        sudo dnf install -y zsh neofetch neovim gcc gcc-c++ make
    elif command_exists pacman; then
        # Arch Linux
        print_status "Using pacman package manager (Arch Linux)"
        sudo pacman -Syu --noconfirm zsh neofetch neovim base-devel
    elif command_exists zypper; then
        # openSUSE
        print_status "Using zypper package manager (openSUSE)"
        sudo zypper refresh
        sudo zypper install -y zsh neofetch neovim gcc gcc-c++ make
    else
        print_error "Unsupported package manager. Please install zsh, neofetch, and neovim manually."
        exit 1
    fi
}

# Function to install fzf
install_fzf() {
    print_status "Installing fzf (fuzzy finder)..."
    
    if [ -d "$HOME/.fzf" ]; then
        print_warning "fzf already exists, updating..."
        cd "$HOME/.fzf" && git pull
    else
        git clone --depth 1 https://github.com/junegunn/fzf.git "$HOME/.fzf"
    fi
    
    # Install fzf
    "$HOME/.fzf/install" --key-bindings --completion --no-update-rc
    
    print_success "fzf installed successfully"
}

# Function to install zoxide
install_zoxide() {
    print_status "Installing zoxide (smart directory navigation)..."
    
    if command_exists zoxide; then
        print_warning "zoxide already installed"
    else
        curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
    fi
    
    print_success "zoxide installed successfully"
}

# Function to install Nerd Font
install_nerd_font() {
    print_status "Installing Nerd Font for Powerlevel10k icons..."
    
    # Try to install via package manager first
    if command_exists apt; then
        # Try to install FiraCode Nerd Font
        if sudo apt install -y fonts-firacode 2>/dev/null; then
            print_success "FiraCode Nerd Font installed via apt"
            return
        fi
    elif command_exists dnf; then
        # Try to install via dnf
        if sudo dnf install -y fira-code-fonts 2>/dev/null; then
            print_success "FiraCode Nerd Font installed via dnf"
            return
        fi
    fi
    
    # Manual installation if package manager fails
    print_warning "Installing Nerd Font manually..."
    
    FONT_DIR="$HOME/.local/share/fonts"
    mkdir -p "$FONT_DIR"
    
    # Download and install FiraCode Nerd Font
    cd /tmp
    wget -q https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraCode.zip
    unzip -q FiraCode.zip -d fira-code
    cp fira-code/*.ttf "$FONT_DIR/"
    rm -rf fira-code FiraCode.zip
    
    # Update font cache
    fc-cache -fv "$FONT_DIR" 2>/dev/null || true
    
    print_success "FiraCode Nerd Font installed manually"
    print_warning "You may need to restart your terminal or set the font manually in your terminal settings"
}

# Function to create .zshrc
create_zshrc() {
    print_status "Setting up .zshrc configuration..."
    
    # Check if .zshrc exists in current directory
    if [ -f ".zshrc" ]; then
        cp ".zshrc" "$HOME/.zshrc"
        print_success ".zshrc copied from current directory"
    else
        print_error "No .zshrc found in current directory!"
        print_error "Please ensure .zshrc is in the same directory as this script."
        print_error "You can download it from: https://github.com/IlanKog99/ZSH-backup"
        exit 1
    fi
}

# Function to create .p10k.zsh
create_p10k_config() {
    print_status "Setting up Powerlevel10k configuration..."
    
    # Check if .p10k.zsh exists in current directory
    if [ -f ".p10k.zsh" ]; then
        cp ".p10k.zsh" "$HOME/.p10k.zsh"
        print_success ".p10k.zsh copied from current directory"
    else
        print_error "No .p10k.zsh found in current directory!"
        print_error "Please ensure .p10k.zsh is in the same directory as this script."
        print_error "You can download it from: https://github.com/IlanKog99/ZSH-backup"
        exit 1
    fi
}

# Function to set zsh as default shell
set_default_shell() {
    print_status "Setting ZSH as default shell..."
    
    ZSH_PATH=$(which zsh)
    if [ -z "$ZSH_PATH" ]; then
        print_error "ZSH not found in PATH"
        return 1
    fi
    
    # Check if zsh is already the default shell
    if [ "$SHELL" = "$ZSH_PATH" ]; then
        print_warning "ZSH is already the default shell"
        return 0
    fi
    
    # Add zsh to /etc/shells if not present
    if ! grep -q "$ZSH_PATH" /etc/shells 2>/dev/null; then
        echo "$ZSH_PATH" | sudo tee -a /etc/shells
    fi
    
    # Change default shell
    chsh -s "$ZSH_PATH"
    print_success "ZSH set as default shell"
    print_warning "You may need to log out and log back in for the changes to take effect"
}

# Function to create necessary directories
create_directories() {
    print_status "Creating necessary directories..."
    
    mkdir -p "$HOME/.cache"
    mkdir -p "$HOME/.local/share"
    mkdir -p "$HOME/.config"
    
    print_success "Directories created successfully"
}

# Main installation function
main() {
    echo -e "${BLUE}========================================${NC}"
    echo -e "${BLUE}    ZSH Setup Script - Automated Install${NC}"
    echo -e "${BLUE}========================================${NC}"
    echo ""
    
    # Check if running as root
    if [ "$EUID" -eq 0 ]; then
        print_error "Please don't run this script as root. It will use sudo when needed."
        exit 1
    fi
    
    # Check for required commands
    if ! command_exists git; then
        print_error "Git is required but not installed. Please install git first."
        exit 1
    fi
    
    if ! command_exists curl; then
        print_error "curl is required but not installed. Please install curl first."
        exit 1
    fi
    
    # Start installation
    create_directories
    install_packages
    install_fzf
    install_zoxide
    install_nerd_font
    create_zshrc
    create_p10k_config
    set_default_shell
    
    echo ""
    echo -e "${GREEN}========================================${NC}"
    echo -e "${GREEN}    Installation Complete!${NC}"
    echo -e "${GREEN}========================================${NC}"
    echo ""
    echo -e "${YELLOW}Next steps:${NC}"
    echo "1. Log out and log back in (or restart your terminal)"
    echo "2. Make sure your terminal is using a Nerd Font for proper icon display"
    echo ""
    echo -e "${BLUE}Your ZSH setup includes:${NC}"
    echo "• Powerlevel10k theme with lean prompt"
    echo "• Zinit plugin manager"
    echo "• Syntax highlighting and autosuggestions"
    echo "• fzf fuzzy finder integration"
    echo "• zoxide smart directory navigation"
    echo "• Custom aliases and keybindings"
    echo "• neofetch on startup"
    echo ""
    echo -e "${YELLOW}Cleanup (optional):${NC}"
    echo "You can now delete the downloaded files:"
    echo "  rm -rf zsh-config/"
    echo ""
    echo -e "${GREEN}Enjoy your new ZSH setup!${NC}"
}

# Run main function
main "$@"
