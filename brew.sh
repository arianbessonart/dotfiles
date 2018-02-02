# Install Homebrew

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
brew upgrade

apps=(
    git
    vim
    wget
)

brew install "${apps[@]}"