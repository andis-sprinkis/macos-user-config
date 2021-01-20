#!/usr/bin/env sh

# brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew update

# command line programs
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

# iterm2
brew install --cask iterm2
## TODO: store and load iterm2 config


# use zsh
chsh -s /usr/bin/zsh

wget --no-cache -P $HOME/ https://raw.githubusercontent.com/andis-sprinkis/linux-user-config/master/.zshrc
if [ -f $HOME/.zshrc.1 ]
then
  rm .zshrc
  mv .zshrc.1 .zshrc
fi

. $HOME/.zshrc


# nvm
## TODO: set and config nvm (node version)


# neovim config
mkdir -p $HOME/.config

git clone git@github.com:andis-sprinkis/neovim-user-config.git $HOME/.config/nvim
