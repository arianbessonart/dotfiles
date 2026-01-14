.PHONY: help install all homebrew git shell node rust vim tmux golang ruby sdkman mac apps clean

# Default target
help:
	@echo "Dotfiles Setup - Available targets:"
	@echo ""
	@echo "  make install    - Run complete setup (recommended for new machines)"
	@echo "  make all        - Same as 'make install'"
	@echo ""
	@echo "Individual components:"
	@echo "  make homebrew   - Install Homebrew and essential CLI tools"
	@echo "  make apps       - Install GUI applications via Homebrew cask"
	@echo "  make git        - Configure Git aliases and settings"
	@echo "  make shell      - Set up Oh My Zsh with themes and plugins"
	@echo "  make node       - Install Node.js tools and global packages"
	@echo "  make rust       - Install Rust toolchain"
	@echo "  make vim        - Set up Neovim with vim-plug"
	@echo "  make tmux       - Set up tmux with plugin manager"
	@echo "  make golang     - Set up Go environment"
	@echo "  make ruby       - Install Ruby tools"
	@echo "  make sdkman     - Install SDKMAN! for JVM tools"
	@echo "  make mac        - Apply macOS system preferences"
	@echo ""
	@echo "Utilities:"
	@echo "  make clean      - Remove symlinked config files"
	@echo "  make status     - Show which configs are installed"

# Main installation target
install: all

all:
	@echo "Starting complete dotfiles setup..."
	@chmod +x setup.sh
	@./setup.sh

# Individual setup targets
homebrew:
	@echo "Installing Homebrew and essential tools..."
	@chmod +x homebrew/install.sh
	@./homebrew/install.sh

apps:
	@echo "Installing GUI applications..."
	@chmod +x homebrew/install-apps.sh
	@./homebrew/install-apps.sh

git:
	@echo "Setting up Git..."
	@chmod +x git/setup.sh
	@./git/setup.sh

shell:
	@echo "Setting up Shell (Oh My Zsh)..."
	@chmod +x shell/setup.sh
	@./shell/setup.sh

node:
	@echo "Setting up Node.js..."
	@chmod +x node/setup.sh
	@./node/setup.sh

rust:
	@echo "Setting up Rust..."
	@chmod +x rust/setup.sh
	@./rust/setup.sh

vim:
	@echo "Setting up Neovim..."
	@chmod +x vim/setup.sh
	@./vim/setup.sh

tmux:
	@echo "Setting up tmux..."
	@chmod +x tmux/setup.sh
	@./tmux/setup.sh

golang:
	@echo "Setting up Go..."
	@chmod +x golang/setup.sh
	@./golang/setup.sh

ruby:
	@echo "Setting up Ruby..."
	@chmod +x ruby/setup.sh
	@./ruby/setup.sh

sdkman:
	@echo "Setting up SDKMAN!..."
	@chmod +x sdkman/setup.sh
	@./sdkman/setup.sh

mac:
	@echo "Applying macOS preferences..."
	@echo "WARNING: This will change system settings. Press Ctrl+C to cancel."
	@sleep 3
	@chmod +x mac/setup.sh
	@./mac/setup.sh

# Utility targets
status:
	@echo "Checking dotfiles installation status..."
	@echo ""
	@echo "Symlinked configs:"
	@if [ -L "$$HOME/.zshrc" ]; then echo "  ✓ .zshrc -> $$(readlink $$HOME/.zshrc)"; else echo "  ✗ .zshrc not linked"; fi
	@if [ -L "$$HOME/.aliases" ]; then echo "  ✓ .aliases -> $$(readlink $$HOME/.aliases)"; else echo "  ✗ .aliases not linked"; fi
	@if [ -L "$$HOME/.gitignore" ]; then echo "  ✓ .gitignore -> $$(readlink $$HOME/.gitignore)"; else echo "  ✗ .gitignore not linked"; fi
	@if [ -L "$$HOME/.tmux.conf" ]; then echo "  ✓ .tmux.conf -> $$(readlink $$HOME/.tmux.conf)"; else echo "  ✗ .tmux.conf not linked"; fi
	@if [ -L "$$HOME/.config/nvim/init.vim" ]; then echo "  ✓ init.vim -> $$(readlink $$HOME/.config/nvim/init.vim)"; else echo "  ✗ init.vim not linked"; fi
	@echo ""
	@echo "Installed tools:"
	@command -v brew >/dev/null 2>&1 && echo "  ✓ Homebrew" || echo "  ✗ Homebrew"
	@command -v git >/dev/null 2>&1 && echo "  ✓ Git" || echo "  ✗ Git"
	@command -v zsh >/dev/null 2>&1 && echo "  ✓ Zsh" || echo "  ✗ Zsh"
	@[ -d "$$HOME/.oh-my-zsh" ] && echo "  ✓ Oh My Zsh" || echo "  ✗ Oh My Zsh"
	@command -v nvim >/dev/null 2>&1 && echo "  ✓ Neovim" || echo "  ✗ Neovim"
	@command -v tmux >/dev/null 2>&1 && echo "  ✓ tmux" || echo "  ✗ tmux"
	@command -v node >/dev/null 2>&1 && echo "  ✓ Node.js" || echo "  ✗ Node.js"
	@command -v rustc >/dev/null 2>&1 && echo "  ✓ Rust" || echo "  ✗ Rust"
	@command -v go >/dev/null 2>&1 && echo "  ✓ Go" || echo "  ✗ Go"

clean:
	@echo "Removing symlinked configuration files..."
	@rm -f $(HOME)/.zshrc && echo "  Removed .zshrc"
	@rm -f $(HOME)/.aliases && echo "  Removed .aliases"
	@rm -f $(HOME)/z.sh && echo "  Removed z.sh"
	@rm -f $(HOME)/.gitignore && echo "  Removed .gitignore"
	@rm -f $(HOME)/.tmux.conf && echo "  Removed .tmux.conf"
	@rm -f $(HOME)/.config/nvim/init.vim && echo "  Removed init.vim"
	@echo ""
	@echo "Symlinks removed. Installed tools and plugins remain."
	@echo "To reinstall configs, run 'make install'"
