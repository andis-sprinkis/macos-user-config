#!/usr/bin/env zsh

# TODO: 
# - add disable system animations commands
# - store and load iterm2:
#  - config
#  - color scheme

# install and update homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew update

# install command-line programs
brew install \
  wget \
  brew \
  bat \
  tree \
  coreutils \
  findutils \
  gnu-tar \
  gnu-sed \
  gawk \
  gnutls \
  gnu-indent \
  gnu-getopt \
  grep \
  ripgrep \
  lf \
  fzf \
  zsh-syntax-highlighting \
  git \
  neovim \
  nvm \
  atool \
  tldr

# install GUI applications
brew install --cask iterm2
brew install --cask keepassxc

# get zsh session config
wget --no-cache -P $HOME/ https://raw.githubusercontent.com/andis-sprinkis/linux-user-config/master/.zshrc
if [ -f $HOME/.zshrc.1 ]; then
  rm $HOME/.zshrc
  mv $HOME/.zshrc.1 $HOME/.zshrc
fi
. $HOME/.zshrc

# install node.js
nvm install --lts
nvm use --lts
nvm alias default lts
. $HOME/.zshrc

# install node.js dependencies
npm install -G yarn
yarn global lehre

# get neovim config
mkdir -p $HOME/.config
git clone git@github.com:andis-sprinkis/neovim-user-config.git $HOME/.config/nvim
. $HOME/.zshrc
