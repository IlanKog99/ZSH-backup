# ZSH Configuration Setup

A complete, automated ZSH configuration setup script that replicates a professional development environment with Powerlevel10k, Zinit plugin manager, and essential productivity tools.

## 🚀 Features

- **Powerlevel10k** - Beautiful, fast ZSH theme with lean prompt style
- **Zinit** - Lightning-fast ZSH plugin manager
- **Syntax Highlighting** - Command syntax highlighting
- **Auto-suggestions** - Intelligent command suggestions
- **fzf Integration** - Fuzzy finder for files and history
- **zoxide** - Smart directory navigation
- **Custom Aliases** - Productivity shortcuts
- **neofetch** - System information on startup

## 📦 What's Included

### Plugins & Tools
- `zsh-syntax-highlighting` - Syntax highlighting for commands
- `zsh-autosuggestions` - Command autosuggestions
- `zsh-completions` - Additional completions
- Oh My Zsh snippets (git, sudo, command-not-found)
- fzf (fuzzy finder)
- zoxide (smart cd)

### Custom Aliases
```bash
nv='nvim'           # Neovim shortcut
ls='ls --color'     # Colored ls
..='cd ..'          # Quick parent directory
reload='source ~/.zshrc'  # Reload config
parrot='curl ascii.live/parrot'  # Fun ASCII art
edit='nv ~/.zshrc'  # Edit config
cls='clear'         # Clear screen
neo='cls && neofetch'  # Clear and show system info
py='python'         # Python shortcut
```

### Key Features
- **History Management**: 5000 entries with deduplication
- **Smart Completions**: Case-insensitive matching
- **Custom Functions**: `mkcd` (mkdir + cd), auto-ls on directory change
- **Keyboard Shortcuts**: Ctrl+P/N for history search

## 🛠️ Installation

### Prerequisites
- Linux system (Ubuntu/Debian, RHEL/CentOS, Fedora, Arch, openSUSE)
- Git
- curl

### Quick Setup
1. Clone this repository:
```bash
git clone https://github.com/yourusername/zsh-config.git
cd zsh-config
```

2. Run the setup script:
```bash
chmod +x setup_zsh.sh
./setup_zsh.sh
```

3. Log out and log back in (or restart your terminal)

### Manual Setup
If you prefer to set up manually:

1. Copy the configuration files:
```bash
cp .zshrc ~/.zshrc
cp .p10k.zsh ~/.p10k.zsh
```

2. Install dependencies:
```bash
# Ubuntu/Debian
sudo apt update && sudo apt install -y zsh git curl neofetch neovim

# Install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# Install zoxide
curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
```

3. Set ZSH as default shell:
```bash
chsh -s $(which zsh)
```

## 🎨 Customization

### Font Setup
This configuration uses Nerd Fonts for icons. Install a Nerd Font like:
- FiraCode Nerd Font
- JetBrains Mono Nerd Font
- Cascadia Code Nerd Font

### Prompt Configuration
Run `p10k configure` to customize your prompt appearance.

### Adding Plugins
Edit `.zshrc` and add plugins using Zinit:
```bash
zinit light username/plugin-name
```

## 📁 Project Structure

```
zsh-config/
├── README.md          # This file
├── setup_zsh.sh       # Automated installation script
├── .zshrc             # Main ZSH configuration
├── .p10k.zsh          # Powerlevel10k theme configuration
├── .gitignore         # Git ignore rules
└── LICENSE            # MIT License
```

## 🔧 Configuration Details

### ZSH Settings
- History size: 5000 entries
- History file: `~/.zsh_history`
- Auto-completion: Case-insensitive
- Key bindings: Emacs mode with custom shortcuts

### Plugin Manager
Uses Zinit for fast plugin loading:
- Automatic installation on first run
- Plugin directory: `~/.local/share/zinit/`
- Cache directory: `~/.cache/`

## 🐛 Troubleshooting

### Common Issues

**Icons not displaying properly:**
- Install a Nerd Font and set it in your terminal settings
- Restart your terminal after font installation

**Plugins not loading:**
- Check internet connection (Zinit downloads plugins from GitHub)
- Run `zinit update` to update plugins

**fzf not working:**
- Ensure fzf was installed correctly: `~/.fzf/install`
- Check if `~/.fzf.zsh` exists and is sourced

### Getting Help
1. Check the [Zinit documentation](https://github.com/zdharma-continuum/zinit)
2. Visit [Powerlevel10k GitHub](https://github.com/romkatv/powerlevel10k)
3. Review ZSH documentation: `man zsh`

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## ⭐ Acknowledgments

- [romkatv](https://github.com/romkatv) for Powerlevel10k
- [zdharma-continuum](https://github.com/zdharma-continuum) for Zinit
- [zsh-users](https://github.com/zsh-users) for essential ZSH plugins
- [junegunn](https://github.com/junegunn) for fzf
- [ajeetdsouza](https://github.com/ajeetdsouza) for zoxide

## 📞 Support

If you find this project helpful, please give it a star ⭐!

For issues and questions, please open an issue on GitHub.
