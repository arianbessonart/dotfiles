## Dotfiles

Personal dotfiles and development environment setup scripts for macOS.

## What's Included

This setup configures:
- **Homebrew**: Package manager and essential CLI tools (git, neovim, fzf, ripgrep, etc.)
- **Git**: Aliases, configuration, and gitignore
- **Shell**: Oh My Zsh with Spaceship theme, zsh-autosuggestions, and custom aliases
- **Node.js**: nvm and global npm packages
- **Rust**: rustup toolchain
- **Neovim**: vim-plug and custom configuration
- **tmux**: Plugin manager and custom configuration
- **Optional**: Go, Ruby, kitty terminal, macOS preferences

## Quick Start

### 1. Clone Repository

```bash
git clone https://github.com/arianbessonart/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

### 2. Run Setup

**Using Make (recommended):**

```bash
make install
```

**Or using the setup script directly:**

```bash
chmod +x setup.sh
./setup.sh
```

The setup will:
1. Install Homebrew and essential apps (macOS only)
2. Configure Git with useful aliases
3. Install Oh My Zsh with themes and plugins
4. Set up Node.js, Rust, Neovim, and tmux
5. Create symbolic links to configuration files

All scripts are idempotent - safe to run multiple times.

### 3. Restart Terminal

```bash
# Restart your terminal or run:
source ~/.zshrc
```

### 4. Install Additional Plugins

- **tmux**: Open tmux and press `prefix + I` to install plugins
- **Neovim**: Run `nvim` and execute `:PlugInstall`

## Using the Makefile

The Makefile provides convenient targets for installation:

```bash
# Show all available commands
make help

# Install everything
make install

# Install individual components
make homebrew     # Install Homebrew and CLI tools
make apps         # Install GUI applications
make git          # Configure Git
make shell        # Set up Oh My Zsh
make vim          # Set up Neovim
make tmux         # Set up tmux
make node         # Set up Node.js
make rust         # Set up Rust
make golang       # Set up Go
make ruby         # Set up Ruby
make sdkman       # Set up SDKMAN!
make mac          # Apply macOS preferences

# Utilities
make status       # Check installation status
make clean        # Remove symlinked configs
```

## Individual Setup Scripts

You can also run individual setup scripts directly:

```bash
./homebrew/install.sh      # Homebrew and CLI tools
./homebrew/install-apps.sh # GUI applications
./git/setup.sh            # Git configuration
./shell/setup.sh          # Oh My Zsh setup
./node/setup.sh           # Node.js tools
./rust/setup.sh           # Rust toolchain
./vim/setup.sh            # Neovim setup
./tmux/setup.sh           # tmux setup
./golang/setup.sh         # Go environment
./ruby/setup.sh           # Ruby tools
./sdkman/setup.sh         # SDKMAN! for JVM
./mac/setup.sh            # macOS preferences
```

## Notes

- The scripts will skip installation if tools are already installed
- Configuration files are symlinked, not copied
- You can clone this repo to any location - scripts use relative paths
- Make sure to review `mac/setup.sh` before running it as it changes system preferences
