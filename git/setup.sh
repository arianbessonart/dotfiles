#!/bin/sh

set -e

source utility

# Clean
rm -f $HOME/.gitignore

install_dotfile "gitignore"

git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.cim "commit -m"
git config --global alias.co checkout
git config --global alias.gc "git checkout"
git config --global alias.gp "git push"
git config --global alias.gl "git pull"
git config --global alias.lol "log --graph --decorate --pretty=oneline --abbrev-commit"
git config --global alias.lola "log --graph --decorate --pretty=oneline --abbrev-commit --all"
git config --global alias.ls ls-files
git config --global alias.st status

git config --global color.ui true

git config --global core.autocrlf input
git config --global core.editor vim
git config --global core.eol lf
git config --global core.excludesfile "$HOME/.gitignore"

git config --global credential.helper osxkeychain

# default push to current branch
git config --global push.default current

# read -p "Email: " email
# [ -z "${email}" ] && email='arianbessonart@gmail.com'

# read -p "Name: " name
# [ -z "${name}" ] && name='Arian Bessonart'

# read -p "Username: " username
# [ -z "${username}" ] && name='arianbessonart'

# git config --global user.email $email
# git config --global user.name $name
# git config --global user.username $username
