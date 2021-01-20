#!/usr/bin/env sh

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew update

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
  zsh \
  git \
  neovim \
  nvm \
  atool \
  tldr

brew install --cask iterm2

wget --no-cache -P $HOME/ https://raw.githubusercontent.com/andis-sprinkis/linux-user-config/master/.zshrc
if [ -f $HOME/.zshrc.1 ]
then
  rm .zshrc
  mv .zshrc.1 .zshrc
fi
