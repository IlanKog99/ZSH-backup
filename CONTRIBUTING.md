# Contributing to ZSH Configuration Setup

Thank you for your interest in contributing to this ZSH configuration project! This document provides guidelines and information for contributors.

## 🚀 Quick Start

1. Fork the repository
2. Clone your fork locally
3. Create a feature branch
4. Make your changes
5. Test your changes
6. Submit a pull request

## 📋 Development Guidelines

### Code Style
- Use consistent formatting in shell scripts
- Add comments for complex functionality
- Follow existing naming conventions
- Test scripts on multiple Linux distributions when possible

### Commit Messages
Use clear, descriptive commit messages:
```
feat: add support for Arch Linux package manager
fix: resolve fzf installation issue on Ubuntu 20.04
docs: update installation instructions
refactor: improve error handling in setup script
```

### Testing
Before submitting a pull request:
- Test the setup script on a clean Linux installation
- Verify all aliases and functions work correctly
- Ensure the script handles errors gracefully
- Test on at least one supported distribution

## 🛠️ Development Setup

### Local Testing
1. Use a virtual machine or container for testing
2. Test the complete installation process
3. Verify all components work after installation
4. Test edge cases and error conditions

### Supported Distributions
- Ubuntu/Debian (apt)
- RHEL/CentOS (yum)
- Fedora (dnf)
- Arch Linux (pacman)
- openSUSE (zypper)

## 📝 Types of Contributions

### Bug Reports
When reporting bugs, please include:
- Operating system and version
- Steps to reproduce the issue
- Expected vs actual behavior
- Any error messages or logs

### Feature Requests
For new features:
- Describe the use case
- Explain how it fits with existing functionality
- Provide examples if applicable

### Code Contributions
- Fix bugs
- Add new features
- Improve documentation
- Optimize performance
- Add support for new distributions

## 🔧 Project Structure

```
zsh-config/
├── README.md          # Main documentation
├── CONTRIBUTING.md    # This file
├── LICENSE            # MIT License
├── setup_zsh.sh       # Main installation script
├── .zshrc             # ZSH configuration
├── .p10k.zsh          # Powerlevel10k theme config
└── .gitignore         # Git ignore rules
```

## 🐛 Bug Reports

Use the GitHub issue template and include:
- **Environment**: OS, version, shell
- **Steps to reproduce**: Clear, numbered steps
- **Expected behavior**: What should happen
- **Actual behavior**: What actually happens
- **Additional context**: Screenshots, logs, etc.

## 💡 Feature Requests

For new features, please:
- Check existing issues first
- Use the feature request template
- Explain the use case clearly
- Consider backwards compatibility

## 🔄 Pull Request Process

1. **Fork and clone** the repository
2. **Create a branch** for your feature/fix
3. **Make your changes** with clear commits
4. **Test thoroughly** on clean installations
5. **Update documentation** if needed
6. **Submit the PR** with a clear description

### PR Requirements
- Clear description of changes
- Reference any related issues
- Include testing information
- Update documentation if needed
- Ensure CI checks pass (if applicable)

## 📚 Documentation

### README Updates
- Keep installation instructions current
- Update feature lists for new additions
- Maintain compatibility information
- Include troubleshooting sections

### Code Documentation
- Comment complex shell script logic
- Explain configuration options
- Document any dependencies or requirements

## 🧪 Testing

### Manual Testing Checklist
- [ ] Script runs without errors on clean system
- [ ] All packages install correctly
- [ ] ZSH becomes default shell
- [ ] All aliases work
- [ ] Plugins load properly
- [ ] Theme displays correctly
- [ ] fzf integration works
- [ ] zoxide integration works

### Automated Testing
Consider adding automated tests for:
- Package manager detection
- Installation script logic
- Configuration file validation

## 🏷️ Versioning

We follow [Semantic Versioning](https://semver.org/):
- **MAJOR**: Breaking changes
- **MINOR**: New features (backwards compatible)
- **PATCH**: Bug fixes (backwards compatible)

## 📞 Support

### Getting Help
- Check existing issues and discussions
- Review documentation thoroughly
- Ask questions in GitHub discussions
- Provide detailed information when asking for help

### Community Guidelines
- Be respectful and constructive
- Help others when possible
- Follow GitHub's community guidelines
- Report inappropriate behavior

## 📄 License

By contributing, you agree that your contributions will be licensed under the MIT License.

## 🙏 Recognition

Contributors will be recognized in:
- README acknowledgments
- Release notes
- GitHub contributors page

Thank you for contributing to make this ZSH configuration better for everyone!
