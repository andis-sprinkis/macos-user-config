#!/usr/bin/env sh

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# update homebrew
brew update

# install command-line programs
brew install \
  wget \
  brew \
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

# install iterm2
brew install --cask iterm2
## TODO: store and load iterm2 config

# set .zshrc
wget --no-cache -P $HOME/ https://raw.githubusercontent.com/andis-sprinkis/linux-user-config/master/.zshrc
if [ -f $HOME/.zshrc.1 ]
then
  rm $HOME/.zshrc
  mv $HOME/.zshrc.1 $HOME/.zshrc
fi

. $HOME/.zshrc

# install node.js
nvm install --lts
nvm use --lts
nvm alias default lts
. $HOME/.zshrc

# neovim config
mkdir -p $HOME/.config

git clone git@github.com:andis-sprinkis/neovim-user-config.git $HOME/.config/nvim
